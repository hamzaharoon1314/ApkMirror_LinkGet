#!/bin/bash

UserAgent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"

page1=$(curl --fail-early --connect-timeout 2 --max-time 5 -sL -A "$UserAgent" "https://www.apkmirror.com/uploads/?appcategory=Snapchat" 2>&1)
readarray -t versions < <(pup -p 'div.widget_appmanager_recentpostswidget h5 a.fontBlack text{}' <<<"$page1")

for version in "${versions[@]}"; do
    if [[ ! "$version" == *"Beta" ]] && [[ ! "$version" == *"beta" ]]; then
        # Extract version number and replace spaces and dots with hyphens
        version=$(echo "$version" | tr -s ' ' | tr '.' '-' | tr '[:upper:]' '[:lower:]')
        version=$(echo "$version" | tr -d ' ' | tr '.' '-')
        echo "$version"
        exit 0
    fi
done

echo "No version without 'Beta' found."
exit 1
