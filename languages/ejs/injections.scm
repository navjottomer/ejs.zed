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

((comment_directive) @comment)