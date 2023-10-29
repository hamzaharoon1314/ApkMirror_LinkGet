#!/bin/bash

UserAgent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"

apkmirrorAppName="$1"
expectedURL="https://www.apkmirror.com/uploads/?appcategory=Snapchat"

page1=$(curl --fail-early --connect-timeout 2 --max-time 5 -sL -A "$UserAgent" "$expectedURL" 2>&1)

if [[ "$page1" == *"$expectedURL"* ]]; then
    readarray -t versions < <(pup -p 'div.widget_appmanager_recentpostswidget h5 a.fontBlack text{}' <<<"$page1")

    for version in "${versions[@]}"; do
        if [[ ! "$version" == *"beta"* ]]; then
            echo "$version"
            exit 0
        fi
    done
    echo "No version without 'beta' found."
    exit 1
else
    echo "Error: Page URL is not as expected."
    exit 1
fi
