#!/bin/bash
set -e
DEPS=/mnt/d/prosperoeden/ProsperoEden-main/.deps
SDK=$DEPS/lapy-ps5-payload-sdk-v0.42
ZIP=$DEPS/ps5-payload-sdk.zip
TMP=$(mktemp -d)

unzip -q "$ZIP" -d "$TMP"

# copy everything from the zip's SDK tree into the SDK dir, overwriting,
# but never delete existing files (keeps bin/clang etc. intact)
cp -a "$TMP/ps5-payload-sdk/." "$SDK/"
rm -rf "$TMP"

for f in ldscripts/elf_x86_64.x target/include/signal.h target/lib/crt1.o; do
    if [ -e "$SDK/$f" ]; then echo "OK   $f"; else echo "MISS $f"; fi
done
echo "top-level:"; ls "$SDK"
