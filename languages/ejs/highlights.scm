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
(code) @embedded.javascript