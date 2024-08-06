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
(#match? @outdent "^\\s*</(div|section|article|main|header|footer|nav)>")