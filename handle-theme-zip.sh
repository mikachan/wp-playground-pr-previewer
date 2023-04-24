#!/bin/bash

handleThemeZip=()

pr_hash="$1"
current_hash="$2"

for theme in $(find * -type d); do
    echo $i
    if git diff --name-only --diff-filter=ACMRT $pr_hash $current_hash | grep -c "^$i/"; then
        for e in "${handleThemeZip[@]}"; do
            [[ "$theme" == "$e"* ]] && continue 2
        done
        handleThemeZip+=("$theme")

        echo "➤ '${theme}' should be zipped "
        zip -r -X $theme.zip $theme
    fi
done