#let sig_ln(position_title, position) = [
        #box[#line(length: 80%)]-#box[#line(length: 19%)]
        Name of #position_title #h(1fr) Date \ 
        #position
]

#let thesis(degree: none, title: none, author: none, year: none) = [
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

        #let preamble = [
        Submitted in partial fulfilment \ 
        of the requirements for the degree of \ 
        #degree in Computer Science
        ]

        #assert(type(title) == str)
        #assert(type(author) == str)
        #assert(type(year) == int)

        #set align(center + horizon)
        // Tries open source Liberation Serif first, falls back to Times New Roman  
        #set text(1em, font: ("Liberation Serif", "Times New Roman"))
        #text(weight: "bold")[#title] \ \ \ \
        by \ 
        #author \ \ \ \
        Submitted in partial fulfilment \ 
        of the requirements for the degree of \ 
        #degree in Computer Science \ \
        at \ \
        Seidenberg School of Computer Science and Information Systems \ \
        Pace University  \ \
        May #year
        #pagebreak()

        #set align(left + top)
        We hereby certify that this #report_type(lower: true), submitted by #author,
        satisfies the dissertation requirements for the degree of _#degree in
        Computer Science_ and has been approved. \ \ \ \
        #sig_ln(box[#report_type() Supervisor], box[Chairperson of #report_type() Committee]) \ \
        #sig_ln("Committee Member 1", box[#report_type() Committee Member]) \ \
        #sig_ln("Committee Member 2", box[#report_type() Committee Member]) \ \ \
        \
        Seidenberg School of Computer Science and Information Systems \
        Pace University #year
        #pagebreak()
        
        #set align(center + top)
        #text(1.2em, weight: "bold")[Abstract] \ \
        #text(1.2em, weight: "bold")[#title] \ \
        by \
        #author \ \ 
        #preamble \ \
        May #year
        #set par(spacing: 2em)


]

