#!/bin/bash
sed -i -e 's/blogwriter.commands.code.start/\<pre class\=\"prettyprint\">\<code class\=\"prettyprint\"\>/g' $1
sed -i -e 's/blogwriter.commands.code.end/\<\/code\>\<\/pre\>/g' $1
sed -i -e 's/blogwriter.commands.toc.insert/\{\% include toc.html html\=content sanitize\=true \%\}/g' $1
echo "Done."
