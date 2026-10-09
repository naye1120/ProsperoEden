#!/bin/bash
INC=/mnt/d/prosperoeden/ProsperoEden-main/.deps/lapy-ps5-payload-sdk-v0.42/target/include
ls -la "$INC/sys" | head -5
echo "--- cdefs:"
ls -la "$INC/sys/cdefs.h" 2>&1
echo "--- zip cdefs exists:"
unzip -Z1 /mnt/d/prosperoeden/ProsperoEden-main/.deps/ps5-payload-sdk.zip | grep -m3 cdefs.h
echo "--- how many files under sys:"
find "$INC/sys" -maxdepth 1 -name '*.h' | wc -l
