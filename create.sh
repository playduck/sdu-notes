#!/bin/sh

# Const definition of german months
MONTHS=("Januar" "Februar" "März" "April" "Mai" "Juni" "Juli" "August" "September" "Oktober" "November" "Dezember")

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Variables
CRTMD=""
CRTPDF=""
WATCH=0
CLASS=""
TOPIC=""

STRMON="$(date +"%m")"
DATE=$(date +"%d. ")${MONTHS[$((10#$STRMON)) - 1]}$(date +" %Y")

# Get flags and opts
while getopts "h?wf:" opt; do
    case "$opt" in
    h|\?)
        echo "-f <file> : create file"
        echo "-w : watch"
        echo "-h : help"
        exit 0
        ;;
    f)
        CLASS=$( echo $OPTARG | rev | cut -d/ -f2 | rev )
        # Capitalize first letter (black magic)
        CLASS=`echo ${CLASS:0:1} | tr  '[a-z]' '[A-Z]'`${CLASS:1}
        CLASS=$( echo $CLASS  | tr '[_]' ' ' )

        TOPIC=$( echo $OPTARG | rev | cut -d/ -f1 | rev )
        TOPIC=$( echo $TOPIC  | tr '[_]' ' ' )

        CRTMD="$OPTARG.md"
        CRTPDF=${OPTARG//markdown/"pdf"}
        CRTPDF="$CRTPDF.pdf"
        ;;
    w)  WATCH=1
        ;;
    esac
done

shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

if [ ! -f $CRTMD ]; then
echo "CRTMD='$CRTMD', Leftovers: $@"

# create file and sub dirs
mkdir -p "$(dirname "$CRTMD")" && touch "$CRTMD"
# write YAML Header
echo "---
date: $DATE
class: $CLASS
...

# $TOPIC

" >> $CRTMD

echo "Copying Folder Structure..."
cd ./markdown/ && find . -type d -exec mkdir -p ../pdf/{} \;
cd ..
sleep 2s

# echo >> $CRTPDF
# create empty pdf
convert xc:none -page A4 $CRTPDF

fi

# open vscode and watch script
if [ $WATCH = 1 ]; then
    echo "Opening $CRTMD VSCode and watching"
    code-insiders -a ./ -g $CRTMD:8
    open $CRTPDF
    ./watch.sh
fi
