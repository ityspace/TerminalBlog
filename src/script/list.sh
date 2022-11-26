#!/bin/sh

POST_DIR="posts/"

cat ./src/pages/header

echo "<h2>Writings</h2>"

for file in $POST_DIR*; do

echo "
    <p>
    <div class=\"postlistdiv\">
    <ul>
    <li>
    <a href=\"$(echo "$file" | sed 's/.txt/.html/')\">$(date -d "$(head -n 1 $file)" +"%Y-%m-%d")  $(head -n 2 $file | tail -n 1)</a>
    </li>
    </ul>
  </div>
  </p>
";
done

cat ./src/pages/footer;
