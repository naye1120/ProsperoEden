#!/usr/bin/env python3
import pathlib
root = pathlib.Path('/mnt/d/prosperoeden/ProsperoEden-main')
for p in root.rglob('*'):
    if p.is_file() and 'NotoSans' in p.name:
        print(p)
