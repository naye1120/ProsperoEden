#!/bin/bash
set -e
D=/mnt/d/prosperoeden/ProsperoEden-main
echo "=== dist ==="
ls -la "$D/dist/"
echo "=== zip contents (language files) ==="
unzip -Z1 "$D/dist/ProsperoEden-v1.000.070.zip" | python3 -c "import sys; [print(l.rstrip()) for l in sys.stdin if 'language' in l.lower()]"
echo "=== app folder ==="
ls "$D/build/release/PPSA99008/"
echo "=== force-language.txt content ==="
cat "$D/build/release/PPSA99008/force-language.txt"
echo "=== ffpfsc contains force-language.txt? ==="
python3 -c "import sys; d=open(sys.argv[1],'rb').read(); print('force-language.txt' in d.decode('latin1'))" "$D/dist/ProsperoEden-v1.000.070.ffpfsc"
