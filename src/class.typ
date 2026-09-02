#import "@preview/cetz:0.5.2"

#let class(
  position,
  name,
  key,
  width: auto,
  tag: (), // Defaulted to an empty array
  generics: (),
  padding: 5pt,
  fields: (),
  methods: (),
) = {
  let header-content = align(center, par(justify: false)[
    #if tag != none and tag != () [
      // Check if tag is an array; if so, join with a comma
      #let tag-display = if type(tag) == array { tag.join(", ") } else { tag }
      _«#tag-display»_ \
    ]
    *#name*
  ])
  
  let field-content = if fields != () {
    par(justify: false, fields.map(f => [#f]).join([\ ]))
  } else { [] }
  
  let operation-content = if methods != () {
    par(justify: false, methods.map(m => [#m]).join([\ ]))
  } else { [] }
  
  let columns = if width == auto { 1 } else { (width, ) }

  let class-body = grid(
    columns: columns,
    inset: padding,
    header-content,
    grid.hline(),
    field-content,
    grid.hline(),
    operation-content
  )

  cetz.draw.group(name: key, {
    cetz.draw.content(
      position,
      text(bottom-edge: "baseline", class-body),
      name: "body",
      frame: "rect",
    )

    if generics != none and generics != () {
      let gen-display = if type(generics) == array { generics.join(", ") } else { generics }
      
      cetz.draw.content(
        "body.north-east",
        box(
          stroke: 1pt,
          fill: white,
          inset: (x: 4pt, y: 4pt),
          [#gen-display]
        ),
        name: "generics",
        anchor: "center"
      )
    }
  })
}

