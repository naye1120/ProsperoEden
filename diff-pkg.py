#!/usr/bin/env python3
import os
from pathlib import Path
ROOT = Path('/mnt/d/prosperoeden/ProsperoEden-main')
APP = ROOT / 'build/release/PPSA99008'
import sys
sys.path.insert(0, str(ROOT / 'headless'))
os.environ['EDEN_PACKAGE_DIR'] = str(APP)
import check_package as cp
actual = {p.relative_to(APP).as_posix() for p in APP.rglob('*') if p.is_file()}
required = set(cp.REQUIRED)
print('in app but not required:', sorted(actual - required))
print('required but missing  :', sorted(required - actual))
