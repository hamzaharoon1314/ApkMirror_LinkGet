#!/bin/bash

UserAgent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"

page1=$(curl --fail-early --connect-timeout 2 --max-time 5 -sL -A "$UserAgent" "https://www.apkmirror.com/uploads/?appcategory=Snapchat" 2>&1)

# Check if the HTML content contains a specific keyword or phrase that indicates it's the correct page
if [[ "$page1" == *"Snapchat related uploads"* ]]; then
    readarray -t versions < <(pup -p 'div.widget_appmanager_recentpostswidget h5 a.fontBlack text{}' <<<"$page1")

    for version in "${versions[@]}"; do
        if [[ ! "$version" == *"Beta" ]] && [[ ! "$version" == *"beta" ]]; then
            echo "$version"
            exit 0
        fi
    done
    echo "No version without 'Beta' found."
    exit 1
else
    echo "Error: Page content is not as expected."
    exit 1
fi
