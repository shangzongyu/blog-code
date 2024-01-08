#!/usr/bin/env bash

DIR="."
if [[ $# == 1 ]]; then
  DIR=$1
fi

echo "Your Process Dir is: ${DIR}"

FILES=$(ls "${DIR}")

for FILE in $FILES; do
  FILENAME=$(basename -- "$FILE")
  EXT="${FILENAME##*.}"
  FILENAME="${FILENAME%.*}"
  if [[ ${EXT} == "md" ]]; then
    echo "${DIR}/${FILENAME}"
    pandoc --pdf-engine=xelatex -V mainfont='LXGW WenKai Mono' "${DIR}/${FILENAME}".md -o "${DIR}/${FILENAME}".pdf
  fi
done
