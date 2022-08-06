#!/bin/bash

echo "Watching ./markdown/* for any changes"
find ./markdown/* -type f | \
 entr -d -p bash ./src/convert.sh /_
