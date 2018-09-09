post_html=$2
layout_file=$1

touch $2.tmp
awk "/\{\{\ content\ \}\}/{system(\"cat $post_html\"); next;}1" $layout_file > $post_html.tmp
mv $post_html.tmp $post_html
