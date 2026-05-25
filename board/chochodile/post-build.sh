#!/bin/sh
set -eu

TARGET_DIR="$1"

SCRIPT_SRC="$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)/chochodile.py"
SCRIPT_DST="${TARGET_DIR}/usr/bin/chochodile.py"

install -D -m 0755 "${SCRIPT_SRC}" "${SCRIPT_DST}"

