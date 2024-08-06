; Increase indent after opening tags
[
  "<%"
  "<%_"
  "<%|"
  "<%~"
  "<%="
  "<%=="
  "<%|="
  "<%|=="
  "<%-"
  "<%#"
  "<%graphql"
] @indent

; Decrease indent before closing tags
[
  "%>"
  "-%>"
  "_%>"
  "=%>"
] @outdent

; Indent HTML content
(content) @indent