#import "@preview/cetz:0.5.2"

#let package(
  position,
  name,
  key,
  width: 140pt,
  height: 100pt,
  padding: 8pt,
  body: [], // Allows you to optionally pass content inside the package
) = {
  cetz.draw.group(name: key, {
    // 1. Draw the main package body
    cetz.draw.content(
      position,
      box(
        width: width,
        height: height,
        inset: padding,
        align(top + left, body),
      ),
      name: "body",
      frame: "rect",
      anchor: "north-west",
    )

    // 2. Stack the tab on top of the left edge
    cetz.draw.content(
      "body.north-west",
      box(inset: (x: 6pt, y: 4pt))[*#name*],
      name: "tab",
      frame: "rect",
      fill: white,
      anchor: "south-west", // Bottom-left of the tab touches top-left of the body
    )

    // 3. Mirror the body's anchors to the group so lines connect nicely
    cetz.draw.anchor("center", "body.center")
    cetz.draw.anchor("south", "body.south")
    cetz.draw.anchor("east", "body.east")
    cetz.draw.anchor("west", "body.west")
    cetz.draw.anchor("north", "body.north")
  })
}
