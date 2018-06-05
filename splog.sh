#!/bin/bash
dir="$( cd "$( dirname "$0" )" && pwd )"

command -v node >/dev/null 2>&1 || { echo "This script requires 'node'. Please install."; exit 1; }
command -v speedtest-cli >/dev/null 2>&1 || { echo "This script requires 'speedtest-cli'. Please install."; exit 1; }

d=$(node -e "console.log(new Date().toJSON());")
speedtest-cli --json > ${dir}/${d}.log 2> ${dir}/${d}.err
