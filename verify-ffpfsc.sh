#!/bin/bash
MKPFS=/root/.cache/prosperoeden-mkpfs/6cb8313dfe0c988ac52617794553f343243d3a56/.venv/bin/python
IMG=/mnt/d/prosperoeden/ProsperoEden-main/dist/ProsperoEden-v1.000.070.ffpfsc
TMP=$(mktemp -d)/out
echo "TMP=$TMP"
"$MKPFS" -m mkpfs unpack "$IMG" "$TMP"; echo "unpack rc=$?"
find "$TMP" | head -30
rm -rf "$TMP"
