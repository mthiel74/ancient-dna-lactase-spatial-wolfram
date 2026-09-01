#!/usr/bin/env python3
"""
Digitise Itan 2009 Fig 3 into a numeric posterior-density field on a lat/lon
grid, then compare it quantitatively with our SMC-ABC origin posterior.

Colour encoding established empirically:
  white (1,1,1)  = sea (no density plotted)
  near-black     = coastlines / graticule / text
  rainbow ramp   = blue -> cyan -> green -> yellow -> red  (low -> high density)
"""
import csv
import numpy as np
from PIL import Image
from scipy.interpolate import PchipInterpolator

REPO = "/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram"
P = f"{REPO}/docs/images/originals/itan2009_fig3_origin_density.png"

im = np.asarray(Image.open(P).convert("RGB")).astype(float) / 255.0
H, W, _ = im.shape

# ---------------------------------------------------------------- georeference
rows = np.array([110., 346., 589., 837., 1088.])
lats = np.array([60., 55., 50., 45., 40.])
row2lat = PchipInterpolator(rows, lats, extrapolate=True)
lat2row = PchipInterpolator(lats[::-1], rows[::-1], extrapolate=True)
def lon_scale(r): return 35.85 + (42.15 - 35.85) * (r - 110.0) / (1290.0 - 110.0)
def lonlat_to_px(lon, lat):
    r = np.asarray(lat2row(lat), dtype=float)
    return 611.0 + lon_scale(r) * np.asarray(lon, dtype=float), r

# ------------------------------------------------------------- colour -> value
# piecewise-linear rainbow path, densely sampled
def ramp_invert(rgb):
    """Analytic inverse of blue->cyan->green->yellow->red; returns (t, residual)."""
    r, g, b = rgb[:, 0], rgb[:, 1], rgb[:, 2]
    seg0 = (b >= g) & (r < 0.5)                    # blue  -> cyan   (b=1, g up)
    seg1 = (b < g) & (r < 0.5) & (b > 0.02)        # cyan  -> green  (g=1, b down)
    seg3 = (g < r) & (b < 0.5) & (r > 0.5)         # yellow-> red    (r=1, g down)
    seg2 = ~(seg0 | seg1 | seg3)                   # green -> yellow (g=1, r up)
    t = np.empty(len(rgb)); rec = np.empty_like(rgb)
    t[seg0] = g[seg0] / 4.0
    rec[seg0] = np.stack([np.zeros(seg0.sum()), g[seg0], np.ones(seg0.sum())], 1)
    t[seg1] = (2.0 - b[seg1]) / 4.0
    rec[seg1] = np.stack([np.zeros(seg1.sum()), np.ones(seg1.sum()), b[seg1]], 1)
    t[seg2] = (2.0 + r[seg2]) / 4.0
    rec[seg2] = np.stack([r[seg2], np.ones(seg2.sum()), np.zeros(seg2.sum())], 1)
    t[seg3] = (4.0 - g[seg3]) / 4.0
    rec[seg3] = np.stack([np.ones(seg3.sum()), g[seg3], np.zeros(seg3.sum())], 1)
    return t, np.linalg.norm(rgb - rec, axis=1)

TOP, BOT, LEF, RIG = 112, 1288, 177, 1888
patch = im[TOP:BOT, LEF:RIG]
ph, pw, _ = patch.shape
flat = patch.reshape(-1, 3)

val, resid = ramp_invert(flat)

lum = flat.mean(axis=1)
is_white = (flat.min(axis=1) > 0.90)          # sea
is_black = (lum < 0.25) & (flat.max(axis=1) < 0.35)   # ink
on_ramp = (resid < 0.28) & ~is_white & ~is_black

value = np.where(on_ramp, val, np.nan).reshape(ph, pw)
print(f"plot area {pw}x{ph}; on-ramp pixels: {on_ramp.sum():,} "
      f"({100*on_ramp.mean():.1f}%), sea {100*is_white.mean():.1f}%, "
      f"ink {100*is_black.mean():.1f}%")

# ------------------------------------------------ resample onto a lat/lon grid
LON = np.arange(-10.0, 32.01, 0.5)
LAT = np.arange(36.0, 60.01, 0.5)
GL, GA = np.meshgrid(LON, LAT)
cc, rr = lonlat_to_px(GL, GA)
ci = np.round(cc - LEF).astype(int)
ri = np.round(rr - TOP).astype(int)
ok = (ci >= 0) & (ci < pw) & (ri >= 0) & (ri < ph)

itan = np.full(GL.shape, np.nan)
# average a small window to beat anti-aliasing and thin coastlines
for dy in (-2, -1, 0, 1, 2):
    for dx in (-2, -1, 0, 1, 2):
        cj = np.clip(ci + dx, 0, pw - 1); rj = np.clip(ri + dy, 0, ph - 1)
        v = value[rj, cj]
        itan = np.where(np.isnan(itan), v, itan)
itan = np.where(ok, itan, np.nan)
land = ~np.isnan(itan)
print(f"grid {GL.shape}, cells with digitised density: {land.sum()} of {land.size}")

np.savez(f"{REPO}/data/processed/itan2009_fig3_digitised.npz",
         lon=LON, lat=LAT, value=itan)

# ---------------------------------------------------------- our own posterior
rows_p = list(csv.DictReader(open(f"{REPO}/data/processed/origin_smc_particles.csv")))
plat = np.array([float(r["OriginLatitude"]) for r in rows_p])
plon = np.array([float(r["OriginLongitude"]) for r in rows_p])
pw_ = np.array([float(r["Weight"]) for r in rows_p]); pw_ /= pw_.sum()

# weighted Gaussian KDE matching the bandwidth used in the notebook map
bwlon, bwlat = 2.6, 2.0
ours = np.zeros(GL.shape)
for la, lo, w in zip(plat, plon, pw_):
    ours += w * np.exp(-0.5*(((GL-lo)/bwlon)**2 + ((GA-la)/bwlat)**2))
ours = np.where(land, ours, np.nan)

# ------------------------------------------------------------------ normalise
wgt = np.cos(np.radians(GA))          # equal-area weights
def norm(f):
    g = np.where(np.isnan(f), 0.0, f) * wgt
    return g / g.sum()
Pi = norm(itan)      # Itan, as digitised (assumes contour bands linear in density)
Po = norm(ours)      # ours

def mode_of(P):
    i = np.unravel_index(np.nanargmax(P), P.shape)
    return LAT[i[0]], LON[i[1]]

def hpd_mask(P, level):
    flat = P.ravel(); order = np.argsort(-flat)
    cum = np.cumsum(flat[order]); k = np.searchsorted(cum, level) + 1
    m = np.zeros_like(flat, bool); m[order[:k]] = True
    return m.reshape(P.shape)

def gc_km(la1, lo1, la2, lo2):
    p1, p2 = np.radians(la1), np.radians(la2)
    dl = np.radians(lo2 - lo1)
    return 6371.0*np.arccos(np.clip(np.sin(p1)*np.sin(p2)+np.cos(p1)*np.cos(p2)*np.cos(dl), -1, 1))

mi, mo = mode_of(Pi), mode_of(Po)
print("\n=== quantitative comparison ===")
print(f"Itan digitised mode : {mi[0]:.1f}N {mi[1]:.1f}E   (paper states ~48.5N, 13E)")
print(f"our posterior mode  : {mo[0]:.1f}N {mo[1]:.1f}E")
print(f"mode separation     : {gc_km(*mi, *mo):.0f} km")

bc = np.sum(np.sqrt(Pi*Po))
print(f"\nBhattacharyya coefficient : {bc:.3f}   (1 = identical, 0 = disjoint)")
print(f"Hellinger distance        : {np.sqrt(max(0.0,1-bc)):.3f}")

for lev in (0.50, 0.95):
    mI, mO = hpd_mask(Pi, lev), hpd_mask(Po, lev)
    inter = (mI & mO).sum(); union = (mI | mO).sum()
    print(f"\n{int(lev*100)}% HPD regions:")
    print(f"  Itan area {mI.sum():5d} cells, ours {mO.sum():5d} cells, "
          f"Jaccard overlap {inter/union:.3f}")
    print(f"  our posterior mass inside Itan's {int(lev*100)}% region : {Po[mI].sum():.3f}")
    print(f"  Itan mass inside our {int(lev*100)}% region             : {Pi[mO].sum():.3f}")

# where does each put its mass, by region?
regions = {
    "Carpathian basin (45-49N,16-23E)": (45, 49, 16, 23),
    "Bavaria/Bohemia  (47-51N,10-17E)": (47, 51, 10, 17),
    "N Germany/Poland (51-55N, 8-20E)": (51, 55, 8, 20),
    "Pontic steppe    (45-52N,25-32E)": (45, 52, 25, 32),
    "France/Iberia    (36-50N,-10-5E)": (36, 50, -10, 5),
    "Scandinavia      (   >55N      )": (55, 61, -10, 32),
}
print("\nposterior mass by region:      Itan(digitised)   ours")
for name, (a, b, c_, d_) in regions.items():
    m = (GA >= a) & (GA < b) & (GL >= c_) & (GL < d_)
    print(f"  {name:34s} {Pi[m].sum():6.3f}        {Po[m].sum():6.3f}")

# the reported point estimate, treated as a fact rather than an image
c, r = 13.0, 48.5
iy = np.argmin(np.abs(LAT-r)); ix = np.argmin(np.abs(LON-c))
for lev in (0.50, 0.95):
    inside = hpd_mask(Po, lev)[iy, ix]
    print(f"\nItan's REPORTED mode (48.5N,13E) inside our {int(lev*100)}% HPD? {bool(inside)}")
print(f"distance from Itan's reported mode to our mode: "
      f"{gc_km(48.5,13.0,*mo):.0f} km")
