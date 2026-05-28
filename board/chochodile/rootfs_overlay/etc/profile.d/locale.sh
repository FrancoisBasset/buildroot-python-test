#!/bin/sh

# With musl, only C/POSIX locales are typically available. Keep a safe
# default locale for interactive console programs.
export LANG=C
export LC_ALL=C
