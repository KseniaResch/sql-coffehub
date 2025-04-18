#!/bin/bash

SOURCE_DIR="./sql-coffehub"
OUTPUT="./coffehub.sql"

if [ ! -d "$SOURCE_DIR" ]; then
  echo " Error: Folder '$SOURCE_DIR' not found."
  exit 1
fi


if [ -f "$OUTPUT" ]; then
  echo "file outpufile exists"
  echo "delete outputfile"
  rm "$OUTPUT"
fi

while IFS= read -r FILE; do
  if [ -f "$FILE" ]; then
    cat "$FILE" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  else
    echo "warning: $FILE not exist"
  fi
done < "$INPUT"

echo "done"
