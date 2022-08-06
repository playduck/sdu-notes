#!/bin/sh

TIMEFORMAT="Recompiled all in %R seconds"
time {
find ./markdown -type f -name "*.md" -exec ./src/convert.sh "{}" \;
printf "\nDone!\n"
}
printf "\n"
