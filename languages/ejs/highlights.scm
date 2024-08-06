; Directives
(directive
  [
    "<%"
    "<%_"
    "<%|"
    "<%~"
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
(code) @embedded