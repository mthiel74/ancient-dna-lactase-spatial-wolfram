"""
Generate educational illustration PNGs for the lactase-persistence
Wolfram Community post using OpenAI gpt-image-2.
Run: python3 generate_lactase_figures.py
Requires: OPENAI_API_KEY in environment, openai Python SDK installed.
Images land beside this script; the notebook builder embeds them with
an explicit AI-disclosure cell, following the ENSO-emergence pattern.
"""

import base64
import os
import sys
import time
from pathlib import Path

from openai import OpenAI

OUTPUT_DIR = Path(os.environ.get("OUT_DIR", Path(__file__).resolve().parent))
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

client = OpenAI()

FIGURES = [
    (
        "neolithic_dairying.png",
        (
            "Educational illustration of a Neolithic European farmstead around 5500 BC for an archaeology-of-food article. "
            "Foreground: a farmer milking a small horned cow of primitive appearance (aurochs-like, brown coat) into a ceramic vessel; "
            "beside them a low wooden table with a perforated pottery sieve draining fresh curds into a second pot (early cheese-making). "
            "Background: wattle-and-daub longhouse with thatched roof, a few goats and sheep, small cultivated plots of emmer wheat, deciduous forest edge. "
            "Soft warm daylight, realistic natural palette, painterly but precise educational style, no text labels, no modern objects. 1536x1024."
        ),
    ),
    (
        "lactase_gene_schematic.png",
        (
            "Clean educational genetics diagram for a science article, white background. "
            "Horizontal schematic of a stretch of human chromosome 2: two gene boxes labelled MCM6 and LCT side by side, drawn as rounded rectangles on a horizontal DNA line. "
            "Inside an intron of MCM6, a highlighted vertical marker labelled '-13910 C>T' with a magnifying-glass call-out showing the single letter change C to T in a short DNA sequence. "
            "A curved arrow from the highlighted variant to the LCT gene labelled 'enhancer keeps LCT switched on'. "
            "Below, two small human silhouettes: left silhouette grey with label 'lactase declines after childhood', right silhouette green with label 'lactase persists in adults'. "
            "Flat modern infographic style, limited palette (steel blue, warm orange, greys), large legible sans-serif labels, no clutter. 1536x1024."
        ),
    ),
    (
        "adna_timeline_workflow.png",
        (
            "Educational infographic showing how ancient DNA lets us watch natural selection happen, for a popular-science article, white background, flat modern style. "
            "Left to right in four panels connected by arrows: "
            "(1) an archaeological excavation with a human skeleton in a trench and a small flag on the skull's petrous bone; "
            "(2) a laboratory scene with a scientist in clean-room suit pipetting at a bench, a DNA double helix rising from the tube; "
            "(3) a stylised genotype readout: a short DNA sequence with one highlighted letter and the label 'rs4988235'; "
            "(4) a simple rising S-shaped curve on axes labelled 'time' and 'allele frequency', with small dots of different ages scattered around the curve. "
            "Limited palette (steel blue, warm orange, sand, greys), large legible sans-serif labels, clean and uncluttered. 1536x1024."
        ),
    ),
]


def generate_and_save(filename: str, prompt: str) -> dict:
    out_path = OUTPUT_DIR / filename
    if out_path.exists():
        print(f"[{filename}] exists, skipping", flush=True)
        return {"file": filename, "status": "ok", "size_kb": out_path.stat().st_size / 1024, "elapsed_s": 0}
    print(f"\n[{filename}] Requesting image from gpt-image-2 ...", flush=True)
    t0 = time.time()
    try:
        response = client.images.generate(
            model="gpt-image-2",
            prompt=prompt,
            size="1536x1024",
            n=1,
        )
        elapsed = time.time() - t0
        b64_data = response.data[0].b64_json
        if b64_data is None:
            raise ValueError("API returned no b64_json data")
        image_bytes = base64.b64decode(b64_data)
        out_path.write_bytes(image_bytes)
        size_kb = len(image_bytes) / 1024
        print(f"[{filename}] Saved {size_kb:.1f} KB in {elapsed:.1f}s", flush=True)
        return {"file": filename, "status": "ok", "size_kb": round(size_kb, 1), "elapsed_s": round(elapsed, 1)}
    except Exception as exc:
        elapsed = time.time() - t0
        print(f"[{filename}] FAILED after {elapsed:.1f}s: {exc}", flush=True)
        return {"file": filename, "status": "error", "error": str(exc), "elapsed_s": round(elapsed, 1)}


def main():
    if not os.environ.get("OPENAI_API_KEY"):
        print("ERROR: OPENAI_API_KEY is not set.", file=sys.stderr)
        sys.exit(1)
    results = [generate_and_save(f, p) for f, p in FIGURES]
    print("\n=== SUMMARY ===")
    for r in results:
        print(" ", r["status"].upper(), r["file"])
    if any(r["status"] != "ok" for r in results):
        sys.exit(1)


if __name__ == "__main__":
    main()
