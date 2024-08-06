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
  (#match? @fold "^\\s*<[^/][^>]*>"))