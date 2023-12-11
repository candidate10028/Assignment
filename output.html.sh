#!/bin/bash

# Reads content of the table.txt file, and stores it in the table_content variable
table_content=$(cat "table.txt")

# Defines a multiline string as a HTML template
page_template='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Candidate 10028&apos;s Project Page</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="" />
</head>
<body>
    <h1>This is my page for the Individual Project</h1>
    <p>This is a simple webpage served by Apache on Ubuntu.</p>
    <pre>
        '"$table_content"'
    </pre>
</body>
</html>'

# Writes the content and saves it to the output.html file
echo "$page_template" > "output.html"
