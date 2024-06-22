#!/bin/bash

# Base URL
base_url="http://127.0.0.1:8002"

# Function to extract all hyperlink URLs from a given webpage and search the entire HTML for long numeric strings
process_pages() {
    echo "Fetching main page to find links..."
    links=$(curl -s "$base_url/alien2.html" | grep -oP 'href="\K[^"]*')

    # Iterate over each subpage link
    for page in $links; do
        echo "Processing link: $base_url/$page"

        # Fetch each subpage and search for long numeric strings in the whole HTML
        html_content=$(curl -s "$base_url/$page")

        # Example: Search for a pattern of a long sequence of digits (considered 10 or more digits here)
        numeric_string=$(echo "$html_content" | grep -oP '\d{10,}')
        
        if [[ -n "$numeric_string" ]]; then
            echo "Found numeric string in $page: $numeric_string"
        fi
    done
}

# Start processing
process_pages
