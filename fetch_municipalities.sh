#!/bin/bash
curl -s https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway > "wikipedia_page.html.txt"

cat "wikipedia_page.html.txt" | tr -d '\n\t' > "wikipage.html.one.line.txt"

sed -E 's|<table class="sortable wikitable jquery-tablesorter">(.*)</table>|\1|g' wikipage.html.one.line.txt | sed 's/</table>/\1/g' 
#| sed -n '1p' 
#| grep -o '<tbody[ >].*<\/tbody' 
#| sed -E 's/<tbody[^>]*>(.*)<\/tbody>/\1/g' 
#| sed -E 's/<tr[^>]*>//g' 
#| sed 's/<\/tr>/\n/g' 
#| sed -E 's/<td[^>]*>//g' 
#| sed 's/<\/td>/\t/g' 
#| sed '1d' > "extracted_table.html.txt"