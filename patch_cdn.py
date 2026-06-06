#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
patch_cdn.py — Vendorise les dépendances CDN d'ImmoSuite pour l'APK hors-ligne.

Usage :
    python patch_cdn.py  chemin/vers/NouvelleVersion.html
    -> écrit www/index.html avec les liens CDN remplacés par vendor/...

Les fichiers vendor/ (email.min.js, leaflet.min.js/css, chart.umd.js)
doivent déjà être présents dans www/vendor/ (fournis dans ce scaffold).
"""
import sys, os, shutil

REPLACEMENTS = [
    ('https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js', 'vendor/email.min.js'),
    ("https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.min.css", "vendor/leaflet.min.css"),
    ("https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.min.js", "vendor/leaflet.min.js"),
    ("https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js", "vendor/chart.umd.js"),
]

def main():
    src = sys.argv[1] if len(sys.argv) > 1 else None
    if not src or not os.path.isfile(src):
        print("Usage: python patch_cdn.py chemin/vers/fichier.html"); sys.exit(1)

    with open(src, encoding='utf-8') as f:
        html = f.read()

    n = 0
    for a, b in REPLACEMENTS:
        if a in html:
            html = html.replace(a, b); n += 1
            print("OK  ->", b)
        else:
            print("(absent)", a)

    os.makedirs('www', exist_ok=True)
    with open('www/index.html', 'w', encoding='utf-8') as f:
        f.write(html)

    restant = sum(1 for a, _ in REPLACEMENTS if a in html)
    print(f"\n{n}/4 liens patchés. CDN restants: {restant}")
    print("-> www/index.html prêt. Lancez ensuite: npx cap sync android")

if __name__ == '__main__':
    main()
