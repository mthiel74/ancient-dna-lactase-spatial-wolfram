#!/usr/bin/env python3
"""
Licence-clean comparison figure: highest-posterior-density contours of our
SMC-ABC origin posterior against those digitised from Itan 2009 Fig 3,
drawn on common axes.  Nothing of the original image is reproduced - only
derived numeric contours.
"""
import csv
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from PIL import Image
from scipy.interpolate import PchipInterpolator
from scipy.ndimage import gaussian_filter

REPO = "/Users/thiel/Documents/GitHub/ancient-dna-lactase-spatial-wolfram"

d = np.load(f"{REPO}/data/processed/itan2009_fig3_digitised.npz")
LON, LAT, itan = d["lon"], d["lat"], d["value"]
GL, GA = np.meshgrid(LON, LAT)
land = ~np.isnan(itan)

# our posterior, same grid / bandwidth as the notebook map
rows = list(csv.DictReader(open(f"{REPO}/data/processed/origin_smc_particles.csv")))
plat = np.array([float(r["OriginLatitude"]) for r in rows])
plon = np.array([float(r["OriginLongitude"]) for r in rows])
w = np.array([float(r["Weight"]) for r in rows]); w /= w.sum()
ours = np.zeros(GL.shape)
for la, lo, ww in zip(plat, plon, w):
    ours += ww*np.exp(-0.5*(((GL-lo)/2.6)**2 + ((GA-la)/2.0)**2))
ours = np.where(land, ours, np.nan)

wgt = np.cos(np.radians(GA))
def norm(f):
    g = np.where(np.isnan(f), 0.0, f)*wgt
    return g/g.sum()
Pi, Po = norm(itan), norm(ours)

def hpd_levels(P, levels):
    """density thresholds enclosing the given mass fractions"""
    flat = np.sort(np.nan_to_num(P).ravel())[::-1]; cum = np.cumsum(flat)
    return [flat[np.searchsorted(cum, L)] for L in levels]

# smooth Itan's banded field slightly so contours are not staircases
Pi_s = np.where(land, gaussian_filter(np.nan_to_num(Pi), 1.2), 0.0)
Pi_s = Pi_s/Pi_s.sum()
print("Itan HPD levels:", hpd_levels(Pi_s, [0.95, 0.50]),
      " max:", Pi_s.max())
print("ours HPD levels:", hpd_levels(Po, [0.95, 0.50]), " max:", np.nanmax(Po))

fig, ax = plt.subplots(figsize=(11.5, 6.6), dpi=170)
ax.set_facecolor("#dce8f2")
ax.contourf(GL, GA, np.where(land, 1.0, np.nan), levels=[0.5, 1.5],
            colors=["#f5f3ee"], zorder=0)
ax.contour(GL, GA, land.astype(float), levels=[0.5],
           colors=["#b9b4a8"], linewidths=0.6, zorder=1)

cI = ax.contour(GL, GA, Pi_s, levels=sorted(hpd_levels(Pi_s, [0.95, 0.50])),
                colors=["#1f6fb4", "#1f6fb4"], linewidths=[1.5, 2.6],
                linestyles=["dashed", "solid"], zorder=3)
cO = ax.contour(GL, GA, Po, levels=sorted(hpd_levels(Po, [0.95, 0.50])),
                colors=["#c0392b", "#c0392b"], linewidths=[1.5, 2.6],
                linestyles=["dashed", "solid"], zorder=4)

def mode_of(P):
    i = np.unravel_index(np.nanargmax(P), P.shape); return LON[i[1]], LAT[i[0]]
mo_i, mo_o = mode_of(Pi_s), mode_of(Po)
ax.plot(*mo_i, marker="*", ms=20, mfc="#1f6fb4", mec="white", mew=1.4, zorder=6)
ax.plot(*mo_o, marker="*", ms=20, mfc="#c0392b", mec="white", mew=1.4, zorder=6)
ax.plot(13.0, 48.5, marker="o", ms=8, mfc="none", mec="#1f6fb4", mew=2.2, zorder=6)

ax.set_xlim(-10, 32); ax.set_ylim(36, 60)
ax.set_xlabel("longitude (°E)"); ax.set_ylabel("latitude (°N)")
ax.set_title("Where did lactase persistence start? Two posteriors, one set of axes",
             fontsize=13, weight="bold", pad=10)
ax.grid(alpha=0.25, lw=0.5)

from matplotlib.lines import Line2D
ax.legend(handles=[
    Line2D([], [], color="#1f6fb4", lw=2.6, label="Itan 2009, 50% HPD (digitised)"),
    Line2D([], [], color="#1f6fb4", lw=1.5, ls="--", label="Itan 2009, 95% HPD"),
    Line2D([], [], color="#c0392b", lw=2.6, label="this work, 50% HPD"),
    Line2D([], [], color="#c0392b", lw=1.5, ls="--", label="this work, 95% HPD"),
    Line2D([], [], color="#1f6fb4", marker="o", ls="none", mfc="none", mew=2,
           label="Itan reported mode (48.5°N, 13°E)"),
], loc="lower left", fontsize=8.5, framealpha=0.94)

fig.text(0.5, 0.005,
         "Itan contours are derived by digitising Fig 3 of Itan et al. 2009 "
         "(PLoS Comput Biol 5(8):e1000491, CC BY); no part of the original image is reproduced.",
         ha="center", fontsize=7.2, color="#555555")
fig.tight_layout(rect=[0, 0.022, 1, 1])
out = f"{REPO}/figures/generated/origin_hpd_comparison.png"
fig.savefig(out)
print("wrote", out)
print(f"Itan digitised mode {mo_i[1]:.1f}N {mo_i[0]:.1f}E ; ours {mo_o[1]:.1f}N {mo_o[0]:.1f}E")
