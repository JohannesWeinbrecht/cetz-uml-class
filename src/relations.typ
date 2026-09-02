#let association(
  ..points
) = {
  cetz.draw.line(
    ..points,
    stroke: black, mark: (end: "straight", scale: 2)
  )
}

#let inheritance(
  ..points
) = {
  cetz.draw.line(
    ..points,
    stroke: black, mark: (end: ">", scale: 2)
  )
}

#let aggregation(
  ..points
) = {
  cetz.draw.line(
    ..points,
    stroke: black, mark: (start: "diamond", scale: 2)
  )
}


#let composition(
  ..points
) = {
  cetz.draw.line(
    ..points,
    stroke: black, mark: (start: "diamond", fill: black, scale: 2)
  )
}