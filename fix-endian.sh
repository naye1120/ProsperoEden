#!/bin/bash
set -e
INC=/mnt/d/prosperoeden/ProsperoEden-main/.deps/lapy-ps5-payload-sdk-v0.42/target/include
if [ ! -e "$INC/endian.h" ]; then
    printf '#pragma once\n#include <sys/endian.h>\n' > "$INC/endian.h"
fi
echo "endian.h:"; cat "$INC/endian.h"
