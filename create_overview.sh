#!/bin/bash

# Function to get file extension
get_extension() {
    filename=$(basename -- "$1")
    echo "${filename##*.}"
}

# Function to determine language for syntax highlighting
get_language() {
    case "$1" in
        toml) echo "toml" ;;
        scm) echo "scheme" ;;
        *) echo "plaintext" ;;
    esac
}

# Create overview.md file
cat << EOF > overview.md
# EJS Extension for Zed

This extension adds support for EJS (Embedded JavaScript) templates to the Zed editor.

## Extension Structure

\`\`\`
.
├── README.md
├── LICENSE
├── text.ejs
├── extension.toml
└── languages
    └── ejs
$(find languages/ejs -type f | sed 's/^/        /')
\`\`\`

## File Contents

### extension.toml

\`\`\`toml
$(cat extension.toml)
\`\`\`

EOF

# Add content of all files in languages/ejs directory
for file in languages/ejs/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        extension=$(get_extension "$file")
        language=$(get_language "$extension")
        
        echo "### $file" >> overview.md
        echo "" >> overview.md
        echo "\`\`\`$language" >> overview.md
        cat "$file" >> overview.md
        echo "\`\`\`" >> overview.md
        echo "" >> overview.md
    fi
done

echo "overview.md has been created with the specified content and syntax highlighting."