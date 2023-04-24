#!/bin/bash

handleThemeZip=()

pr_sha="$1"
sha="$2"

echo $1
echo $2

for theme in $(find * -type d); do
    if git diff --name-only --diff-filter=ACMRT ${{ pr_sha }} ${{ sha }} | grep -c "^$i/"; then
        for e in "${handleThemeZip[@]}"; do
            [[ "$theme" == "$e"* ]] && continue 2
        done
        handleThemeZip+=("$theme")

        echo "➤ '${theme}' should be zipped "
        zip -r -X $theme.zip $theme
    fi
done