#!/bin/sh
set -eu

BINARIES_DIR="$1"

if [ -f "${BINARIES_DIR}/rootfs.iso9660" ]; then
	cp -f "${BINARIES_DIR}/rootfs.iso9660" "${BINARIES_DIR}/chochodile.iso"
fi

