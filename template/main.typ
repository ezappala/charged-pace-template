#import "@local/charged-pace-template:0.1.0": thesis

#let author = "Forename Surname"
#let title = "A Typst Template for a PhDCS Dissertation or MSCS Thesis"
#let year = 2026
#let degree = "Master's" // "Master's" | "PhD"
#let abstract = [
        An abstract should be typed single-spaced and contain no more than 350 words. \ \
        This template was created based on _CSIS DPS Guide for Formatting the Dissertation._ \ \
        If your abstract spans two pages, be sure that the "Table of Contents" is numbered with the correct roman numeral. 
]

#thesis(
        title, 
        author, 
        year, 
        degree,
        abstract: abstract
)

