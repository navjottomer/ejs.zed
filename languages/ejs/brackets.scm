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
  "%>"        @close)