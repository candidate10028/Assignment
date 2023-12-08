#!/bin/bash

#Fetching the Wkik page
url="https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway"
curl -s "$url" > wikipedia_page.html

#Extracting the table with grep (find the right wikipage structure)
awk '/<table class="sortable.wikitable.jquery-tablesorter"/,/</table>/' wikipedia_page.html > extracted_table.html

cat > output.html <<EOL
        <!DOCTYPE html>
        <html lang="en">
        <head>
                <meta charset="UTF-8" />
                <title>Candidate 10028's Project Page</title>
                <meta name="viewport" content="width=device-width,initial-scale=1" />
                <meta name="description" content="" />
        </head>
        <body>
                <h1>This is my page for the Individual Project</h1>
                <p>This is a simple webpage served by Apache on Ubuntu.</p>

$(cat extracted_table.html)
</body>
</html>
EOL

xdg-open output.html

