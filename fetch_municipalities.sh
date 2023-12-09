#!/bin/bash

# 1 - save the index webpage as an HTML file
curl -s https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway > wiki.list.html

# 2 - remove all newlines and tabs; prepare the file for grep (because grep evaluates everything line by line, so we'd want all HTML/text on a single line)
cat "wiki.list.html" | tr -d '\n\t' > wiki.list.no.newlines.html

# 3 - find the table with all links; extract it; the table has classes "sortable wikitable", which are used to identify it; <table> and <tbody> are removed; <tr> are replaced with newline characters; <td> are replaced with "tab" characters; the 1st line is deleted
sed -E 's/.*<table class="sortable wikitable">(.*)<\/table>.*/\1/g' wiki.list.no.newlines.html | sed 's/<\/table>/\n/g' | sed -n '1p' | grep -o '<tbody[ >].*<\/tbody>' | sed -E 's/<tbody[^>]*>(.*)<\/tbody>/\1/g' | sed -E 's/<tr[^>]*>//g' | sed 's/<\/tr>/\n/g' | sed -E 's/<td[^>]*>//g' | sed 's/<\/td>/\t/g' | sed '1d' > table.txt