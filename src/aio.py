#!/usr/bin/env python3

import os
import sys
import datetime

MONTHS=("Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember")

YAML_START = "---"
YAML_END = "..."
yaml_section = False

currClass = "sdu"
markdownDir = "./markdown/"

srcPath = os.path.join(markdownDir, currClass)
aioName = os.path.join(srcPath, f"_{currClass}-master.md" )
aioNamePdf = os.path.join(f"./pdf/{currClass}", f"_{currClass}-master.pdf" )

currentTime = datetime.datetime.now()

print(f"creating {aioName} ...")
f = open(aioName, "w")
f.write(f"""---
date: {currentTime.day} {MONTHS[currentTime.month - 1]} {currentTime.year}
class: {currClass}
...

\\tableofcontents

\\clearpage
\\newpage

""")
f.close()

files = os.listdir( srcPath )
fileWithPath = [os.path.join(srcPath, f) for f in files]
fileWithPath.sort(key=lambda f: os.path.getctime(f))

print(fileWithPath)

markdownFiles = filter(lambda x: x.endswith(".md"), fileWithPath)

for f in markdownFiles:
    if f == aioName:
        continue

    print(f"processing {f} ...")

    with open(f, "r") as infile, open(aioName, "a") as outfile:
        for line in infile:
            if line.startswith(YAML_START):
                yaml_section = True
                continue
            elif line.startswith(YAML_END):
                yaml_section = False
                continue

            if not yaml_section:
                outfile.write(line)

print("compiling...")

compileCmd = f"./src/convert.sh {aioName}"
os.system(compileCmd)

print("opening ...")

openCmd = f"open {aioNamePdf}"
os.system(openCmd)

print("done")
