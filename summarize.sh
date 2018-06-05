#!/bin/bash

command -v jq >/dev/null 2>&1 || { echo "This script requires 'jq'. Please install."; exit 1; }

function extract {
  for f in ./*.log
  do
    cat $f | jq '{timestamp: .timestamp, ping: .ping, down: .download, up: .upload}' && echo ","
  done
}

echo "{\"values\": [$(echo "$(extract)" | sed '$d')]}" | jq "."
