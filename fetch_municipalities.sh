#!/bin/bash

# Download the Wikipedia page
curl -s https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway > "wikipedia_page.html.txt"

# Combine the content into one line
cat "wikipedia_page.html.txt" | tr -d '\n\t' > "wikipage.html.one.line.txt"

# Extract content between <table> and </table> tags
sed -n -E 's|<table class="sortable wikitable jquery-tablesorter">(.*)</table>|\1|p' "wikipage.html.one.line.txt" > "test.txt"

# Remove </table> tags
sed -E 's|<\/table>||g' "test.txt" > "test_tmp.txt" && mv "test_tmp.txt" "test.txt"

# Uncomment the following lines if you want to perform additional processing
sed -n '1p' "test.txt"

grep -o '<tbody[ >].*<\/tbody' "test.txt" | sed -E 's|<tbody[^>]*>(.*)<\/tbody>|\1|g'

sed -E 's|<tr[^>]*>|\n|g' "test.txt" | sed '/^$/d'

sed -E 's|<td[^>]*>|\t|g' "test.txt" | sed -E 's|<\/td>||g' > "extracted_table.html.txt"
