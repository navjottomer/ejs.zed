((content) @injection.content
 (#set! injection.language "html")
 (#set! "combined"))

((code) @injection.content
 (#set! injection.language "javascript")
 (#set! "combined"))

((directive
  (code) @injection.content)
 (#set! injection.language "javascript"))

((output_directive
  (code) @injection.content)
 (#set! injection.language "javascript"))

((comment_directive) @comment)