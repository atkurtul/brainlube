#!/usr/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

for file in ./bin/*; do
  if [[ "${file##*.}" != "ll" ]]; then
    name="${file##*/}"
    echo -ne $GREEN"Running $BLUE$name$NC >\n"
    $file
    echo -ne $GREEN"\nDONE\n$NC"
    echo -ne "##########################################"
    echo "##########################################"
    sleep 0.2
  fi
done
