((content) @content
 (#set! "language" "html")
 (#set! "combined"))

((directive
  (code) @content)
 (#set! "language" "javascript")
 (#set! "combined"))

((output_directive
  (code) @content)
 (#set! "language" "javascript")
 (#set! "combined"))

((graphql_directive
  (code) @content)
 (#set! "language" "graphql")
 (#set! "combined"))

((comment_directive) @comment)