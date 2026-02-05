#let sig_ln(position_title, position) = [
        #box[#line(length: 80%)]-#box[#line(length: 19%)]
        Name of #position_title #h(1fr) Date \
        #position
]

#let preamble(degree) = [
        #assert(degree == "Master's" or degree == "PhD", message: "Degree must be one of \"Master's\" or \"PhD\"") 
        Submitted in partial fulfilment \ 
        of the requirements for the degree of \ 
        #degree in Computer Science
]

#let thesis(title, author, year, degree, abstract: none) = [
        #assert(degree == "Master's" or degree == "PhD", message: "Degree must be one of \"Master's\" or \"PhD\"") 

        #let report_type(lower: false) = {
                if lower {
                        if degree == "Master's" [thesis]
                        if degree == "PhD" [dissertation]
                } else {
                        if degree == "Master's" [Thesis]
                        if degree == "PhD" [Dissertation]
                }
        }

        #assert(type(title) == str)
        #assert(type(author) == str)
        #assert(type(year) == int)

        #show heading.where(level: 1): set align(center + top)
        #set page("us-letter")

        #set align(center + horizon)
        // Tries open source Liberation Serif first, falls back to Times New Roman  
        #set text(1em, font: ("Times New Roman"))
        #text(weight: "bold")[#title]
        #v(4em)
        by \
        #author
        #v(4em)
        #preamble(degree)
        #v(2em)
        at
        #v(2em)
        Seidenberg School of Computer Science and Information Systems
        #v(2em)
        Pace University
        #v(2em)
        May #year
        #pagebreak()

        #set align(left + top)
        We hereby certify that this #report_type(lower: true), submitted by #author,
        satisfies the dissertation requirements for the degree of _#degree in
        Computer Science_ and has been approved.
        #v(4em)
        #sig_ln(box[#report_type() Supervisor], box[Chairperson of #report_type() Committee])
        #v(2em)
        #sig_ln("Committee Member 1", box[#report_type() Committee Member])
        #v(2em)
        #sig_ln("Committee Member 2", box[#report_type() Committee Member])
        #v(4em)
        Seidenberg School of Computer Science and Information Systems \
        Pace University #year
        #pagebreak()

        // #set align(center + top)
        #set page(numbering: "i.")
        = Abstract
        #v(2em)
        #abstract
        #pagebreak()

        = Acknowledgment
        #v(2em)
        Acknowledgement body should list any external help you received in researching and writing this #report_type(lower: true).
        #pagebreak()

        #outline(title: "Table of Contents")

        #pagebreak()
        #outline(title: "List of Tables", target: table)
        #pagebreak()
        #outline(title: "List of Figures", target: table)

        #pagebreak()
        #set heading(numbering: "I.A.a)")
        #show heading: it => {
                // Find out the final number of the heading counter.
                let levels = counter(heading).get()
                let deepest = if levels != () {
                        levels.last()
                } else {
                        1
                }

                if it.level == 1 {
                        // First-level headings are centered smallcaps.
                        // We don't want to number the acknowledgment section.
                        let is-ack = it.body in ([Acknowledgment], [Acknowledgement], [Acknowledgments], [Acknowledgements])
                        set align(center)
                        show: block.with(above: 1.25em, below: 1.2em, sticky: true)
                        show: smallcaps

                        if it.numbering != none and not is-ack {
                                numbering("I.", deepest)
                                h(0.5em, weak: true)
                        }

                        it.body
                } else if it.level == 2 {
                        // Second-level headings are run-ins.
                        set text(style: "italic")
                        show: block.with(spacing: 1em, sticky: true)

                        if it.numbering != none {
                                numbering("A.", deepest)
                                h(0.5em, weak: true)
                        }

                        it.body
                } else [
                        // Third level headings are run-ins too, but different.
                        #if it.level == 3 {
                                numbering("a)", deepest)
                                [ ]
                        }
                        _#(it.body):_
                ]
        }

        #set page(numbering: "1.", margin: (left: 10em, rest: auto))
        #set par(spacing: 2em)
        = Primary
        == Secondary
        === Tertiary
        #pagebreak()
        ==== test 3
        = hi
        == hi
        #pagebreak()
        === hi 2
        #pagebreak()
        = what
        == what
        = where
        == where
        === where 3
]
