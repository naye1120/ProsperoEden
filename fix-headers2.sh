#!/bin/bash
set -e
DEPS=/mnt/d/prosperoeden/ProsperoEden-main/.deps
SDK=$DEPS/lapy-ps5-payload-sdk-v0.42
ZIP=$DEPS/ps5-payload-sdk.zip
INC=$SDK/target/include

# 1. remove bogus symlinks pointing at glibc /usr
find "$INC" -type l -lname '/usr/*' -delete
echo "symlinks to /usr removed"

# 2. extract the SDK's own include tree fully to a temp dir
TMP=$(mktemp -d)
unzip -q "$ZIP" 'ps5-payload-sdk/target/include/*' -d "$TMP"

# 3. copy over, restoring real dirs/files (zip is authoritative for include/)
cp -a "$TMP/ps5-payload-sdk/target/include/." "$INC/"
rm -rf "$TMP"

# 4. verify critical headers
for h in signal.h poll.h endian.h sys/cdefs.h sys/_types.h x86/_types.h; do
    if [ -e "$INC/$h" ]; then echo "OK   $h"; else echo "MISS $h"; fi
done
echo "include entries: $(ls "$INC" | wc -l)"
