#!/bin/sh
set -eu

TARGET_DIR="$1"

REPO_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"
SCRIPT_SRC="${REPO_DIR}/chochodile.py"
SCRIPT_DST="${TARGET_DIR}/usr/bin/chochodile.py"

install -D -m 0755 "${SCRIPT_SRC}" "${SCRIPT_DST}"

if [ ! -x "${TARGET_DIR}/usr/bin/python3" ] && [ -x "${TARGET_DIR}/usr/bin/python3.14" ]; then
	ln -sf python3.14 "${TARGET_DIR}/usr/bin/python3"
fi

if [ ! -x "${TARGET_DIR}/usr/bin/python3" ]; then
	echo "ERROR: /usr/bin/python3 is missing from the target rootfs" >&2
	echo "Run: make python3-reinstall && make" >&2
	exit 1
fi

rm -f \
	"${TARGET_DIR}/etc/init.d/S01seedrng" \
	"${TARGET_DIR}/etc/init.d/S01syslogd" \
	"${TARGET_DIR}/etc/init.d/S02klogd" \
	"${TARGET_DIR}/etc/init.d/S02sysctl" \
	"${TARGET_DIR}/etc/init.d/S11modules" \
	"${TARGET_DIR}/etc/init.d/S40network" \
	"${TARGET_DIR}/etc/init.d/S50crond" \
	"${TARGET_DIR}/etc/init.d/S99chochodile"
