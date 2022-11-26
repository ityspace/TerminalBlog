#!/bin/sh

POST_DIR="posts/"

for file in $POST_DIR*; do

echo "
<li><a href=\"$(echo "$file" | sed 's/.txt/.html/')\">$(date -d "$(head -n 1 $file)" +"%Y-%m-%d")  $(head -n 2 $file | tail -n 1)</a></li>
" >> tmp/listrc.txt
done

sort -n tmp/listrc.txt -o tmp/list.txt
