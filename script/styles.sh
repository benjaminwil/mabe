post_html=$2
stylesheet_ref=$1

awk "{gsub(/\{\{\ stylesheet\ \}\}/,\"hey\");}" $post_html
