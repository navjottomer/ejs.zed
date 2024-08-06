# EJS Extension for Zed

This extension adds support for EJS (Embedded JavaScript) templates to the Zed editor.

## Extension Structure

```
.
├── README.md
├── LICENSE
├── text.ejs
├── extension.toml
└── languages
    └── ejs
        languages/ejs/indents.scm
        languages/ejs/highlights.scm
        languages/ejs/folds.scm
        languages/ejs/config.toml
        languages/ejs/injections.scm
        languages/ejs/brackets.scm
```

## File Contents

### extension.toml

```toml
id = "ejs"
name = "EJS"
description = "EJS (Embedded JavaScript) language support"
version = "0.0.1"
schema_version = 1
authors = ["Navjot Tomer <navjottomer@gmail.com>"]
repository = "https://github.com/navjottomer/zed-ejs"

[grammars.embedded_template]
repository = "https://github.com/tree-sitter/tree-sitter-embedded-template"
commit = "38d5004a797298dc42c85e7706c5ceac46a3f29f"
```

### languages/ejs/brackets.scm

```scheme
```

### languages/ejs/config.toml

```toml
name = "EJS"
grammar = "embedded_template"
path_suffixes = ["ejs"]
line_comment = "<%#"
autoclose_before = ";:.,=}])>"
word_characters = ["-"]
```

### languages/ejs/folds.scm

```scheme
; Fold directives
(directive) @fold
(output_directive) @fold

; Fold multi-line comments
(comment_directive
  "<%#" @fold.start
  (comment) @fold.inner
  "%>" @fold.end) @fold

; Fold single-line comments
(comment_directive) @fold

(graphql_directive) @fold

; Fold HTML content between EJS tags
(template 
  (content) @fold
  (#match? @fold "^\\s*<[^/][^>]*>"))```

### languages/ejs/highlights.scm

```scheme
; Directives
(directive
  [
    "<%"
    "<%_"
    "<%|"
  ] @punctuation.special
  (code)? @embedded
  [
    "%>"
    "-%>"
    "_%>"
  ] @punctuation.special
)

; Output directives
(output_directive
  [
    "<%="
    "<%=="
    "<%|="
    "<%|=="
    "<%-"
  ] @punctuation.special
  (code)? @embedded
  [
    "%>"
    "-%>"
    "=%>"
  ] @punctuation.special
)

; Comment directive
(comment_directive
  "<%#" @comment
  (comment)? @comment
  "%>" @comment
)

; GraphQL directive
(graphql_directive
  "<%graphql" @punctuation.special
  (code)? @embedded
  "%>" @punctuation.special
)

; Content (HTML)
(content) @text.html

; Code
(code) @embedded```

### languages/ejs/indents.scm

```scheme
```

### languages/ejs/injections.scm

```scheme
((content) @content
 (#set! "language" "html")
 (#set! "combined"))

((code) @content
 (#set! "language" "javascript")
 (#set! "combined"))

((comment_directive) @comment)```

