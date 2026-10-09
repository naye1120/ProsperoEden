#!/usr/bin/env python3
import pathlib
root = pathlib.Path('/mnt/d/prosperoeden/ProsperoEden-main/headless')
for p in root.rglob('*'):
    if p.suffix in ('.cpp', '.hpp', '.h') and p.is_file():
        try:
            t = p.read_text(errors='ignore')
        except Exception:
            continue
        if 'AppFile' in t:
            for i, line in enumerate(t.splitlines(), 1):
                if 'AppFile(' in line and ('=' in line or '(' in line) and ('std::string' in line or 'inline' in line or 'return' in line):
                    print(f'{p}:{i}: {line.strip()}')
