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

if [ -f "${TARGET_DIR}/etc/inittab" ]; then
	sed -i \
		-e 's~^::shutdown:/etc/init.d/rcK$~::shutdown:/etc/init.d/rcK >/dev/null 2>\&1~' \
		-e 's~^::shutdown:/sbin/swapoff -a$~::shutdown:/sbin/swapoff -a >/dev/null 2>\&1~' \
		-e 's~^::shutdown:/bin/umount -a -r$~::shutdown:/bin/umount -a -r >/dev/null 2>\&1~' \
		"${TARGET_DIR}/etc/inittab"
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
