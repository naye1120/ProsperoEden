#!/bin/bash
# Fix SDK headers: extract any missing files from ps5-payload-sdk.zip
set -e
DEPS=/mnt/d/prosperoeden/ProsperoEden-main/.deps
SDK=$DEPS/lapy-ps5-payload-sdk-v0.42
ZIP=$DEPS/ps5-payload-sdk.zip
INC=$SDK/target/include

# List zip entries under target/include/
unzip -Z1 "$ZIP" | grep '^ps5-payload-sdk/target/include/' | grep -v '/$' > /tmp/zip_inc.txt
echo "zip include entries: $(wc -l < /tmp/zip_inc.txt)"

missing=0
while IFS= read -r entry; do
    rel=${entry#ps5-payload-sdk/target/include/}
    if [ ! -e "$INC/$rel" ]; then
        # extract single file to temp then move
        unzip -o -q -j "$ZIP" "$entry" -d /tmp/ziptmp
        base=$(basename "$entry")
        mkdir -p "$(dirname "$INC/$rel")"
        mv "/tmp/ziptmp/$base" "$INC/$rel"
        missing=$((missing+1))
    fi
done < /tmp/zip_inc.txt
echo "extracted missing: $missing"
ls -la "$INC/signal.h"
