#!/bin/bash

# TASK 1
# Capture the content in the webpage, and move it into a .html file
curl -s https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway > wiki.list.html

# Take the content and remove newline and tab characters, this is saved into a new .html file
cat "wiki.list.html" | tr -d '\n\t' > wiki.list.no.newlines.html

# Extracts the specific table 'sortable wikitable' for later use, then formats the contens to capture the table content, delete the first line, remove <table> and <tbody> tags, and replace <tr> tags with newline characters and <td> tags with tab characters.
sed -E 's/.*<table class="sortable wikitable">(.*)<\/table>.*/\1/g' wiki.list.no.newlines.html | sed 's/<\/table>/\n/g' | sed -n '1p' | grep -o '<tbody[ >].*<\/tbody>' | sed -E 's/<tbody[^>]*>(.*)<\/tbody>/\1/g' | sed -E 's/<tr[^>]*>//g' | sed 's/<\/tr>/\n/g' | sed -E 's/<td[^>]*>//g' | sed 's/<\/td>/\t/g' | sed '1d' > table.txt