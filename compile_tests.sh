#!/usr/bin/bash

cargo build --release
CC=./target/release/brainlube

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
    clang $tmp.ll -o ./bin/$name -Wno-override-module
    echo -ne $GREEN"DONE\n$NC"
    echo -ne "##########################################"
    echo "##########################################"
  fi
done
