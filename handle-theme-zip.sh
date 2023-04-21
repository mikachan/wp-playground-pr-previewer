handleThemeZip=()

for theme in $(find * -type d); do
    if ...; then # check if $theme contains changes
        for e in "${handleThemeZip[@]}"; do
            [[ "$theme" == "$e"* ]] && continue 2
        done
        handleThemeZip+=("$theme")

        echo "➤ '${theme}' should be zipped "
        zip -r -X $theme.zip $theme
    fi
done