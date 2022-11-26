#!/bin/sh

#Configuration
 DOMAIN="https://ityspace.github.io"
 TITLE="Title"                               DESCRIPTION="Your Description"
 COPYRIGHT="CC 1.0"
 POST_DIR="posts/"
 TTL="60"
 AUTHOR="unknown"
 TIME=$(date +"%T %Z")

echo "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<?xml-stylesheet href=\"rss.xsl\" type=\"text/xsl\"?>
<rss version=\"2.0\">
  <channel>
    <title>$TITLE</title>
    <link>$DOMAIN</link>
    <description>$DESCRIPTION</description>
    <copyright>$COPYRIGHT</copyright>
    <ttl>$TTL</ttl>";

for file in $POST_DIR*; do

echo "<item>
  <pubDate>$(head -n 1 $file) $TIME</pubDate>
  <category>$(date -d "$(head -n 1 $file)" +"%Y/%m/%d")</category>
  <title>$(head -n 2 $file | tail -n 1)</title>
  <link>"$(echo "$DOMAIN/$file" | sed 's/.txt/.html/')"</link>
  <description>
    <![CDATA[
<pre style='border: 0; white-space: pre-wrap; word-break: break-word;'>$(tail -n +4 $file | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</pre>]]>
  </description>
  <author>$AUTHOR</author>
  <guid>$(echo "$DOMAIN/$file" | sed 's/.txt/.html/')</guid>
  </item>";
done

echo "  </channel>
</rss>";
