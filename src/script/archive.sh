#!/bin/sh

cat ./src/pages/header

echo "<h2>Writings</h2>"

echo "
<p>
    <div class=\"postlistdiv\">
    <ul>
"

cat tmp/list.txt

echo "
    </ul>
  </div>
  </p>
";
cat ./src/pages/footer;
