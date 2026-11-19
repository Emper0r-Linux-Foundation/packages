#!/bin/sh
set -eu

src=${1:?usage: apply.sh <kernel-src> <patch-dir>}
pdir=${2:?usage: apply.sh <kernel-src> <patch-dir>}

while IFS= read -r line || [ -n "$line" ]; do
	line=${line%%#*}
	set -- $line
	[ "$#" -eq 0 ] && continue
	patch -Np1 -d "$src" --no-backup-if-mismatch -i "$pdir/$1"
done < "$pdir/series"
