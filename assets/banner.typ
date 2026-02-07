#import "lib.typ": *

#set page(
  width: 318pt,
  height: 148pt,
  margin: 5pt,
  fill: none,
)

#set text(
  size: 75pt,
  font: font,
  fill: foreground,
  top-edge: "bounds",
  bottom-edge: "bounds",
)

#set align(right + bottom)

impala

#place(
  left + top,
  image(
    bytes(
      read("wifi-svgrepo-com.svg").replace(
        "#000000",
        foreground.to-hex(),
      ),
    ),
    height: 1em,
  ),
)

