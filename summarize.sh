#!/bin/bash
dir="$( cd "$( dirname "$0" )" && pwd )"
data=${dir}/data

command -v jq >/dev/null 2>&1 || { echo "This script requires 'jq'. Please install."; exit 1; }

function extract {
  for f in ${data}/*.log
  do
    cat $f | jq '{timestamp: .timestamp, ping: .ping, down: .download, up: .upload}' && echo ","
  done
}

echo "{\"values\": [$(echo "$(extract)" | sed '$d')]}" | jq "."
