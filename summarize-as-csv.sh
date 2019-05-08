#!/bin/bash
dir="$( cd "$( dirname "$0" )" && pwd )"
data=${dir}/data

command -v jq >/dev/null 2>&1 || { echo "This script requires 'jq'. Please install."; exit 1; }

function extract {
  for f in ${data}/*.log
  do
    cat $f | jq -r '[.timestamp, .ping, .upload, .download] | map(tostring) | join(",")' 
  done
}
echo "timestamp, ping, up, down"
extract
