#!/bin/sh

# With musl, only C/POSIX locales are typically available. Force UTF-8
# handling through Python env vars (set in S99chochodile) and keep a safe
# default locale here.
export LANG=C
export LC_ALL=C
