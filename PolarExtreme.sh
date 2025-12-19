#!/bin/sh
echo -ne '\033c\033]0;PolarExtreme\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/PolarExtreme.x86_64" "$@"
