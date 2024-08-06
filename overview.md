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
; Directive brackets
(directive
  "<%"  @open
  "%>"  @close)

(directive
  "<%_" @open
  "_%>" @close)

(directive
  "<%|" @open
  "%>"  @close)

; Output directive brackets
(output_directive
  "<%="  @open
  "%>"   @close)

(output_directive
  "<%==" @open
  "%>"   @close)

(output_directive
  "<%|=" @open
  "%>"   @close)

(output_directive
  "<%|==" @open
  "%>"    @close)

(output_directive
  "<%-"  @open
  "%>"   @close)

; Comment directive brackets
(comment_directive
  "<%#" @open
  "%>"  @close)

; GraphQL directive brackets
(graphql_directive
  "<%graphql" @open
  "%>"        @close)```

### languages/ejs/config.toml

```toml
name = "EJS"
grammar = "embedded_template"
path_suffixes = ["ejs"]
line_comments = ["<%# ", "<!-- "]
scope_to_injection_language = true
injection_language = "javascript"

brackets = [
    { start = "<%", end = "%>", close = true, newline = true },
    { start = "<%=", end = "%>", close = true, newline = false },
    { start = "<%-", end = "%>", close = true, newline = false },
    { start = "<%#", end = "%>", close = true, newline = true },
    { start = "(", end = ")", close = true, newline = false },
    { start = "[", end = "]", close = true, newline = false },
    { start = "{", end = "}", close = true, newline = true },
    { start = "\"", end = "\"", close = true, newline = false, not_in = ["string", "comment"] },
    { start = "'", end = "'", close = true, newline = false, not_in = ["string", "comment"] },
]```

### languages/ejs/highlights.scm

```scheme
; Directives
(directive
  [
    "<%"
    "<%_"
    "<%|"
  ] @tag.delimiter
  (code)? @embedded.javascript
  [
    "%>"
    "-%>"
    "_%>"
  ] @tag.delimiter
)

; Output directives
(output_directive
  [
    "<%="
    "<%=="
    "<%|="
    "<%|=="
    "<%-"
  ] @tag.delimiter
  (code)? @embedded.javascript
  [
    "%>"
    "-%>"
    "=%>"
  ] @tag.delimiter
)

; Comment directive
(comment_directive
  "<%#" @comment
  (comment)? @comment
  "%>" @comment
)

; GraphQL directive
(graphql_directive
  "<%graphql" @tag.delimiter
  (code)? @embedded.graphql
  "%>" @tag.delimiter
)

; Content (HTML)
(content) @text.html

; Code
(code) @embedded.javascript```

### languages/ejs/indents.scm

```scheme
[
  (directive)
  (output_directive)
  (comment_directive)
  (graphql_directive)
] @indent

[
  "%>"
  "-%>"
  "_%>"
  "=%>"
] @outdent

; HTML-like indentation
(content) @indent

; Specific HTML tags that should indent their content
(content) @indent
(#match? @indent "^\\s*<(div|section|article|main|header|footer|nav)\\b")

; Closing tags for specific HTML elements
(content) @outdent
(#match? @outdent "^\\s*</(div|section|article|main|header|footer|nav)>")```

### languages/ejs/injections.scm

```scheme
((directive
  (code) @content)
 (#set! language "javascript")
 (#set! combined))

((output_directive
  (code) @content)
 (#set! language "javascript")
 (#set! combined))

((content) @content
 (#set! language "html")
 (#set! combined))

((graphql_directive
  (code) @content)
 (#set! language "graphql")
 (#set! combined))

((comment_directive) @comment)```

