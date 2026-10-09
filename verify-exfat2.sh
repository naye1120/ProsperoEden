#!/bin/bash
MKPFS=/root/.cache/prosperoeden-mkpfs/6cb8313dfe0c988ac52617794553f343243d3a56/.venv/bin/python
IMG=/mnt/d/prosperoeden/ProsperoEden-main/dist/ProsperoEden-v1.000.070.ffpfsc
OUT=/tmp/ffpfsc-check
rm -rf "$OUT"
mkdir -p "$OUT"
"$MKPFS" -m mkpfs unpack "$IMG" "$OUT/out" >/dev/null 2>&1
ls -la "$OUT/out"
python3 - "$OUT/out/PPSA99008.exfat" <<'PY'
import sys, re
data = open(sys.argv[1], 'rb').read()
print('force-language.txt:', 'force-language.txt'.encode('utf-16-le') in data)
names = set()
for m in re.finditer(b'(?:[\x20-\x7e]\x00){3,40}\x2e\x00t\x00x\x00t\x00', data):
    names.add(m.group().decode('utf-16-le'))
print('txt names:', sorted(names))
PY
