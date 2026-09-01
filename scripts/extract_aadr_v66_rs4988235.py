#!/usr/bin/env python3
"""AADR v66 rs4988235 dataset, v2: exact rs182549, dedup by individual."""
import csv, re
from collections import Counter

NIND, NSNP = 23089, 1233013
REC = (NSNP + 3) // 4
HDR = 48

rows = {}
with open("/Users/thiel/aadr_v66/v66.snp") as f:
    for i, line in enumerate(f):
        t = line.split()
        if t and t[0] == "rs4988235": rows["rs4988235"] = (i, t[4], t[5])
        if t and t[0] == "rs182549": rows["rs182549"] = (i, t[4], t[5])
print("rows:", rows)   # rs182549 should be chr2:136616754

ids = [l.split()[0] for l in open("/Users/thiel/aadr_v66/v66.ind")]

def read_snp(row):
    byte, pos = row // 4, row % 4
    sh = (6, 4, 2, 0)[pos]
    vals = bytearray(NIND)
    with open("/Users/thiel/aadr_v66/v66.geno", "rb") as f:
        for i in range(NIND):
            f.seek(HDR + i * REC + byte)
            vals[i] = (f.read(1)[0] >> sh) & 3
    return vals

g235 = read_snp(rows["rs4988235"][0])
g549 = bytearray([3])*0 or bytearray([3]*NIND)
print("rs4988235:", Counter(g235), " (rs182549 not on 1240K panel; channel empty)")

anno = {}
with open("/Users/thiel/aadr_v66/v66.anno", encoding="utf-8", errors="replace") as fh:
    rd = csv.reader(fh, delimiter="\t"); next(rd)
    for row in rd:
        if row: anno[row[0]] = row

def num(x):
    try: return float(x)
    except Exception: return None

def gstr(v, diploid, ra=("G", "A")):
    if v == 3: return ""
    if v == 1: return ra[0] + ra[1]
    if diploid: return ra[0]*2 if v == 2 else ra[1]*2
    return ra[0] if v == 2 else ra[1]

cand = {}
for i, gid in enumerate(ids):
    v = g235[i]
    if v == 3: continue
    a = anno.get(gid)
    if a is None: continue
    bp, lat, lon = num(a[10]), num(a[17]), num(a[18])
    if bp is None or bp <= 0 or lat is None or lon is None: continue
    snphit = num(a[26]) or 0
    base = gid.split(".")[0].split("_")[0]
    if base in cand and cand[base]["_snphit"] >= snphit:
        continue
    diploid235 = (".DG" in gid or ".SG" in gid or v == 1)
    called = 2 if diploid235 else 1
    derived = (2 - v) if diploid235 else (1 if v == 0 else 0)
    if v == 1: derived = 1
    v5 = g549[i]
    diploid549 = (".DG" in gid or ".SG" in gid or v5 == 1)
    m = re.search(r"(19|20)\d\d", a[5])
    cand[base] = {
        "GeneticID": gid, "SampleID": base, "Publication": a[5],
        "PublicationYear": m.group(0) if m else "", "GroupID": a[14],
        "Locality": a[15], "Country": a[16],
        "Latitude": lat, "Longitude": lon, "MeanDateBP": bp,
        "DateSD": a[11], "DateRange": a[12],
        "RS4988235Genotype": gstr(v, diploid235),
        "CalledAlleles": called, "DerivedAlleles": derived,
        "RS182549Genotype": gstr(v5, diploid549, ("C", "T")) if v5 != 3 else "",
        "_snphit": snphit,
    }

out = list(cand.values())
for r in out: r.pop("_snphit")
print("kept after dedup:", len(out))

with open("/Users/thiel/aadr_v66/aadr_v66_rs4988235_raw.csv", "w", newline="") as fh:
    w = csv.DictWriter(fh, fieldnames=list(out[0].keys()))
    w.writeheader(); w.writerows(out)

eur = [r for r in out if 34 <= r["Latitude"] <= 72 and -12 <= r["Longitude"] <= 45]
print(f"Europe box: {len(eur)}")
print("window        n    alleles  derived")
for lo, hi in [(0,2000),(2000,4000),(4000,5000),(5000,6000),(6000,8000),(8000,12000)]:
    sub = [r for r in eur if lo <= r["MeanDateBP"] < hi]
    print(f"{lo:5d}-{hi:5d} {len(sub):5d} {sum(r['CalledAlleles'] for r in sub):8d} "
          f"{sum(r['DerivedAlleles'] for r in sub):8d}")
early = sorted((r for r in eur if r["MeanDateBP"] >= 5500 and r["DerivedAlleles"] > 0),
               key=lambda r: -r["MeanDateBP"])
print(f"carriers >=5500 BP: {len(early)}")
for r in early:
    print(f"  {r['MeanDateBP']:7.0f} {r['Country'][:14]:14s} {r['RS4988235Genotype']:2s} "
          f"rs182549={r['RS182549Genotype']:2s} {r['GeneticID'][:20]}")
# concordance channel: rs182549 T should accompany rs4988235 A on the European haplotype
both = [r for r in out if r["RS4988235Genotype"] and r["RS182549Genotype"]]
tab = Counter((("A" in r["RS4988235Genotype"]), ("T" in r["RS182549Genotype"])) for r in both)
print("LD check (hasA, hasT):", dict(tab))
