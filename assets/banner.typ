#import "lib.typ": *

#set page(
  width: auto,
  height: auto,
  margin: (x: 10pt, top: 70pt, bottom: 25pt),
  fill: none,
)

#set text(
  size: 75pt,
  font: font,
  fill: foreground,
)

#set align(center + horizon)

#place(
  center + horizon,
  dx: 5pt,
  dy: -50pt,
  image(
    "impala.svg",
    height: 75pt,
  ),
)

#stack(
  dir: ltr,
  spacing: .5em,
  [Impala],
)
