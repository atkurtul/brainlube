#!/usr/bin/bash

CC=./target/debug/brainlube

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
mkdir -p bin

for file in ./tests/*; do
  if [[ "${file##*.}" == "bf" ]]; then
    tmp="${file%.*}"
    name="${tmp##*/}"
    echo -ne $GREEN"Compiling $BLUE$name$NC >\n"
    $CC $file -o $tmp.ll
    clang $tmp.ll -o ./bin/$name
    echo -ne $GREEN"DONE\n$NC"
    echo -ne "##########################################"
    echo "##########################################"
    sleep 0.2
  fi
done

