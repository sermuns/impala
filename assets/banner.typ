#import "@preview/digestify:0.1.0": bytes-to-hex, md5

#set page(
  width: auto,
  height: auto,
  margin: 1em,
)
#set text(
  font: "Libertinus Sans",
  size: 75pt,
  top-edge: "bounds",
  bottom-edge: "bounds",
)

#let logo(font, inset, text-color, wifi-color) = block(
  width: 318pt,
  height: 148pt,
  inset: if inset == none {
    (x: 4.65pt, y: 5.1pt)
  } else {
    inset
  },
  {
    set text(
      font: font,
      fill: text-color,
    )
    set align(right + bottom)

    [impala]
    place(
      left + top,
      image(
        bytes(
          read("wifi-svgrepo-com.svg").replace(
            "#000000",
            wifi-color.to-hex(),
          ),
        ),
        height: 1em,
      ),
    )
  },
)


#let fonts = (
  ("Monaspace Xenon", none),
  ("Monaspace Argon", none),
  ("Monaspace Krypton", (x: 7.0pt, y: 5.0pt)),
  ("Monaspace Neon", none),
  ("Monaspace Radon", (x: 5.7pt, y: 4.8pt)),
  ("JetBrains Mono", (x: 11.8pt, y: 6.1pt)),
  ("Libertinus Mono", (x: 2.8pt, y: 6.1pt)),
  ("Libertinus Sans", (x: 10.8%, y: 5.5%)),
  ("Hanken Grotesk", (x: 8.55%, y: 5.0%)),
).sorted(key: e => e.at(0))

#let impala-fur-color = rgb("#7d6a40")
#let impala-horns-color = rgb("#582f1c")
#let red = rgb("#583b0e")

#let text-colors = (
  impala-fur-color,
  impala-horns-color,
  red,
)
#let wifi-colors = (
  impala-fur-color,
  impala-horns-color,
  red,
)

#let logos = for wifi-color in wifi-colors {
  for text-color in text-colors {
    for (font, inset) in fonts {
      (logo(font, inset, text-color, wifi-color),)
    }
  }
}

#set stack(dir: ltr)
#grid(
  columns: fonts.len(),
  gutter: 1em,
  align: center + horizon,
  ..fonts.map(e => text(0.5em, e.at(0))),
  ..logos
    .enumerate()
    .map(((i, logo)) => stack(
      [#i],
      logo,
    )),
)

#align(
  right,
  bytes-to-hex(md5(bytes(repr(logos)))),
)
