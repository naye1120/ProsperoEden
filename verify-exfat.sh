#!/bin/bash
MKPFS=/root/.cache/prosperoeden-mkpfs/6cb8313dfe0c988ac52617794553f343243d3a56/.venv/bin/python
IMG=/mnt/d/prosperoeden/ProsperoEden-main/dist/ProsperoEden-v1.000.070.ffpfsc
OUT=/tmp/ffpfsc-check
rm -rf "$OUT"
"$MKPFS" -m mkpfs unpack "$IMG" "$OUT" >/dev/null 2>&1
python3 - "$OUT/PPSA99008.exfat" <<'PY'
import sys
data = open(sys.argv[1], 'rb').read()
for name in ('force-language.txt', 'eboot.bin', 'param.json'):
    print(name, '->', name.encode('utf-16-le') in data)
# also print the force-language content if found (small file, look for zh-Hans bytes)
print('zh-Hans ascii ->', b'zh-Hans' in data)
PY
