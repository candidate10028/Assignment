#!/bin/bash

#Fetching the Wkik page
#wget -O wikipedia_page.html https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway
curl -s https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway > "wikipedia_page.html.txt"

cat "wikipedia_page.html.txt" | tr -d '\n\t' > "wikipage.html.one.line.txt"

sed -E 's/.<table class"sortable wikitable jquery-tablesorter">(.*)</table>.*/\1\g' wikipage.html.on.line.txt | sed 's/</table>/\1/g' | sed -n '1p' | grep -o '<tbody[ >].*<\/tbody' |sed -E 's/<tbody[^>]*>(.*)<\/tbody>/\1/g' | sed -E 's/<tr[^>]*>//g' | sed 's/<\/tr>/\n/g' | sed -E 's/<td[^>]*>//g' | sed 's/<\/td>/\t/g' | sed '1d' > "extracted_table.html.txt"

#Extracting the table with grep (find the right wikipage structure)
#awk '/<table class="sortable.wikitable.jquery-tablesorter"/,/</table>/' wikipedia_page.html > extracted_table.html
#cat wikipedia_page.html | grep -A 100 '<table' | grep -B 100 '</table>' > extracted_table.html
#Filtering the extrated table with awk
#awk '/<table/,/<\/table>/' extracted_table.html > filtered_table.html

#cat > output.html <<EOL
 #       <!DOCTYPE html>
  #      <html lang="en">
   #     <head>
    #            <meta charset="UTF-8" />
     #           <title>Candidate 10028's Project Page</title>
      #          <meta name="viewport" content="width=device-width,initial-scale=1" />
       #         <meta name="description" content="" />
        #</head>
        #<body>
         #       <h1>This is my page for the Individual Project</h1>
          #      <p>This is a simple webpage served by Apache on Ubuntu.</p>

#$(cat filtered_table.html)
#</body>
#</html>
#EOL

#xdg-open output.html