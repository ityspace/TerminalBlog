#!/bin/sh

POST_DIR="tmp/posts/"

cp posts tmp/ -r

for file in $POST_DIR*; do

DOMAIN="https://ityspace.github.io"
COPYRIGHT="CC0 1.0 Universal"
AUTHOR="unknown"
DESCRIPTION="Your Description"
TITLE=$(head -n 2 $file | tail -n 1)
DATE=$(head -n 1 $file	)

sed -i '1, 2d' $file

test -d public/posts || mkdir public/posts;

sh src/script/markdown.sh $file > $(echo "./tmp$file" | sed 's/tmp\/posts//');

echo "
<!DOCTYPE html>
<html lang=\"zh\">
  <head>
    <title>$TITLE</title>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <meta name=\"description\" content=\"$DESCRIPTION\" >
    <meta name=\"author\" content=\"$AUTHOR\">
    <link rel=\"canonical\" href=\"$DOMAIN\">
    <style>
" > $(echo "./public/posts$file" | sed 's/.txt/.html/' | sed 's/tmp\/posts//');

cat ./src/pages/post_styles >> $(echo "./public/posts$file" | sed 's/.txt/.html/' | sed 's/tmp\/posts//');

echo "
    </style>
  </head>
  <body>
    <div class=\"container\">
      <header class=\"header\">
        <ul>
          <li>
            <a href=\"/index.html\">Home</a>
          </li>
          <li>
            <a href=\"/archive.html\">Archive</a>
          </li>
        </ul>
        <ul>
          <li>
            <a href=\"/feed.xml\">RSS</a>
          </li>
        </ul>
        <hr>
      </header>
      <article class=\"content\">
      <h1>$TITLE</h1>
      <h4>$DATE</h4>
" >> $(echo "./public/posts$file" | sed 's/.txt/.html/' | sed 's/tmp\/posts//');

cat $(echo "./tmp$file"| sed 's/tmp\/posts//') >> $(echo "./public/posts$file" | sed 's/.txt/.html/' | sed 's/tmp\/posts//');	


cat ./src/pages/footer >> $(echo "./public/posts$file" | sed 's/.txt/.html/' | sed 's/tmp\/posts//');

done
