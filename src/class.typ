#let padding = 0.5em

#let class(
  position,
  name,
  key,
  width: auto,
  tag: none,
  generics: (),
  fields: (),
  methods: (),
) = {
  let header-content = align(center, par(justify: false)[
    #if tag != none [
     _«#tag»_ \
    ]
    *#name*
  ])
  
  let field-content = par(justify: false, fields.join([#linebreak()]))
  let operation-content = par(justify: false, methods.join([#linebreak()]))
  let columns = if width == auto { 1 } else { (width, ) }

  let content = grid(
    columns: columns,
    inset: padding,
    header-content,
    grid.hline(),
    field-content,
    grid.hline(),
    operation-content
  )

  cetz.draw.content(
    position,
    text(bottom-edge: "baseline", content),
    name: key,
    frame: "rect",
  )
}