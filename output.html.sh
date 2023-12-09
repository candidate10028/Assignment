#!/bin/bash

# Assuming you have some content in "table.only.txt"
table_content=$(cat "table.txt")

# HTML template with embedded table content
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

# Save the HTML content to "output.html"
echo "$page_template" > "output.html"
