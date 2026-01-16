// Setting empty par
#let empty_par() = {
  v(-1em)
}

// Construction of paper
#let master_thesis(
  // The master thesis title.
  title: "ここにtitleが入る",
  en-title: "",

  // The paper`s author.
  author: "ここに著者が入る",

  // The author's information
  university: "",
  school: "",
  department: "",
  term: "",
  lab: "",
  class: "修士",
  date: (datetime.today().year(), datetime.today().month(), datetime.today().day()),

  paper-type: "論文",

  // The paper size to use.
  paper-size: "a4",

  // The paper's content.
  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: author)

  // Set the body font. TeX Gyre Pagella is a free alternative
  // to Palatino.
  set text(
    font: (
      "Adobe Caslon Pro",
      "Times New Roman", // Windows
      // "Yu Mincho", // Windows
      "FOT-UDMincho Pr6N",
      "Noto Serif JP",
    ), 
    size: 12pt,
    lang: "ja"
  )

  // Configure the page properties.
  set page(
    paper: paper-size,
    margin: (bottom: 1.75cm, top: 2.25cm),
  )

  // The first page.
  align(center)[
    #v(80pt)
    #text(
      size: 16pt,
    )[
      #term
    ]

    #text(
      size: 16pt,
    )[
      #school #department
    ]

    #text(
      size: 16pt,
    )[
      #class#paper-type
    ]
    #v(40pt)
    #text(
      size: 22pt,
    )[
      #title
    ]

    #text(
      size: 16pt,
    )[
      #en-title
    ]
    #v(50pt)
    #text(
      size: 16pt,
    )[
        #university #school #department
    ]

    #text(
      size: 16pt,
    )[
        #lab
    ]

    #text(
      size: 16pt,
    )[
        #author
    ]
    #v(40pt)
    #text(
      size: 16pt,
    )[
      #date.at(0) 年 #date.at(1) 月 #date.at(2) 日 提出
    ]
  ]

  set page(
    numbering: "1",
  )

  counter(page).update(1)
  // Configure chapter headings.
  set heading(numbering: (..nums) => {
    nums.pos().map(str).join(".") + " "
  })
  show heading.where(level: 1): it => {
    pagebreak()
    set text(weight: "bold", size: 20pt)
    set block(spacing: 1.5em, below: 2em)
    set align(center)
    it
  }
  show heading.where(level: 2): it => {
    set text(weight: "bold", size: 16pt)
    set block(above: 2em, below: 2em)
    it
  }
  show heading: it => {
    set text(weight: "bold", size: 14pt)
    set block(above: 1.5em, below: 2em)
    it
  } + empty_par()

  // Configure paragraph properties.
  set par(
    leading: 1.05em, 
    first-line-indent: (all: true, amount: 1em), 
    justify: true, 
    spacing: 1.05em
  )

  // set table properties
  let frame(stroke) = (x, y) => (
    left: none,
    right: none,
    top: if y < 2 { stroke } else { 0pt },
    bottom: stroke, 
  )
  set table(
    // fill: (_, y) => if calc.odd(y) { rgb("EEEEEE") },
    stroke: frame(rgb("000000")),
    align: left,
    inset: (x:20pt, y:10pt),
  )
  show table.cell.where(y: 0): set text(weight: "bold")
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  // Configure figure caption
  show figure.caption: it => {
    set par(first-line-indent: 0em)
    set text(weight: "bold")
    set align(left)
    it
  }

  // Start with a chapter outline.
  show outline.entry: it => {
    set par(first-line-indent: 0em,)
    if it.level == 1 {
      set text(weight: "bold")
      it
    } else {
      it
    }
  }

  outline(
    title: "目次",
    depth: 2,
  )
  counter(page).update(1)
  body
}

// LATEX character
#let LATEX = {
  [L];box(move(
    dx: -4.2pt, dy: -1.2pt,
    box(scale(65%)[A])
  ));box(move(
  dx: -5.7pt, dy: 0pt,
  [T]
));box(move(
  dx: -7.0pt, dy: 2.7pt,
  box(scale(100%)[E])
));box(move(
  dx: -8.0pt, dy: 0pt,
  [X]
));h(-8.0pt)
}