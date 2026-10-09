#!/usr/bin/env python3
import pathlib
root = pathlib.Path('/mnt/d/prosperoeden/ProsperoEden-main')
for p in list(root.rglob('*.sh')) + list(root.rglob('*.py')) + [root / 'Makefile']:
    if not p.is_file():
        continue
    if any(part in ('.deps', 'build', 'dist', '.git', '.local') for part in p.parts):
        continue
    try:
        t = p.read_text(errors='ignore')
    except Exception:
        continue
    for i, line in enumerate(t.splitlines(), 1):
        if 'NotoSansSC-OFL' in line or 'NotoSansSC' in line:
            print(f'{p}:{i}: {line.strip()}')
