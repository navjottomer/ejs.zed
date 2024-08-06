; Standard brackets
("(" @open ")" @close)
("[" @open "]" @close)
("{" @open "}" @close)

; EJS-specific brackets
("<%"  @open "%>" @close)
("<%=" @open "%>" @close)
("<%-" @open "%>" @close)
("<%_" @open "%>" @close)
("<%#" @open "%>" @close)