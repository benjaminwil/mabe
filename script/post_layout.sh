post_html=$2
post_layout=$1

touch $2.tmp
awk "/\{\{\ content\ \}\}/{system(\"cat $post_html\"); next;}1" $post_layout > $post_html.tmp
mv $post_html.tmp $post_html
