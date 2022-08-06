#!/bin/bash

# --lua-filter=./src/replace_metadata.lua \

CC='lualatex'
CO='\033[0;33m'
NC='\033[0m' # No Color
exit=0

in=$1

tex=${in/markdown/"tex"}
tex=${tex/md/"tex"}

temp=${in/markdown/"temp"}
temp=${temp/md/"pdf"}

pdf=${in/markdown/"pdf"}
pdf=${pdf/md/"pdf"}

texPath=$(dirname $tex)
mkdir -p $texPath

tempPath=$(dirname $temp)
mkdir -p $tempPath

pdfPath=$(dirname $pdf)
mkdir -p $pdfPath

ulimit -n 512

printf "Converting $in\nto $tex ...\n"

TIMEFORMAT="%R"
time {
pandoc -s -N \
--template=./src/template.tex \
--metadata-file ./src/header.yaml \
--highlight-style pygments \
--filter pandoc-plot \
-V temp-path=$tempPath \
-f markdown \
-t latex \
-o $tex \
$in

exit=$?

printf "Compiling $tex\nto $temp...\n"
$CC --shell-escape -output-directory=$tempPath $tex

printf "Moving $temp\nto $pdf\n"
mv $temp $pdf

printf "Done in ${CO}"
}

printf "${NC}Exited with code ${CO}$exit${NC}\n"

if [ $exit != 0 ]; then
    osascript -e 'display notification "Failed with exit code '$exit'" with title "Pandoc Error"'
fi
