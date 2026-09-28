#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# ruan's blobs take dizi's fixups; only the device name differs.

from importlib.machinery import SourceFileLoader
from pathlib import Path

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

dizi = SourceFileLoader(
    'dizi_extract_files',
    str(Path(__file__).resolve().parent.parent / 'dizi' / 'extract-files.py'),
).load_module()

module = ExtractUtilsModule(
    'ruan',
    'xiaomi',
    blob_fixups=dizi.blob_fixups,
    lib_fixups=dizi.lib_fixups,
    namespace_imports=dizi.namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
