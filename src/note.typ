#let note(
  position,
  body,
  key,
  width: auto,
) = {
  let columns = if width == auto { 1 } else { (width, ) }

  let content = grid(
    columns: columns,
    inset: padding,
    par(justify: false, body),
  )

  cetz.draw.content(
    position,
    text(bottom-edge: "baseline", content),
    name: key,
    frame: "rect",
    fill: rgb(255, 255, 193),
  )

  cetz.draw.content(key + ".north-east", emoji.pin)
}