arcpubs
-------

A latex class which to automatically update a publication record for the
grant application process of the Australian Research Council.

Generate a .bib file containing all your papers of various kinds. Most
reference management software such as Endnote, Jabref, Mendeley etc should
be able to export to this format. 

A document is automatically generated which contains separate sections for
books, book sections, journal articles and conference proceedings. You
specify your last name, so that any papers which you didn't coauthor are
not included. Your name is then made bold and underlined. 

The file example.tex shows how to use the class. The one subtlety is that
it uses biblatex instead of bibtex. This shouldn't be a real problem, as
biblatex is included in all modern latex distributions. An example file
`example.tex` is included. To compile it, run

    latex example
    biber example
    latex example

Note that you may need to rerun latex a few more times to get all the numbering
correct. 

Please note that this class was knocked together in about one day, and has only
been tested under Miktex 2.9. Please check the generated file carefully, as **I
cannot give a 100% guarantee** that the formatting will be compliant with ARC
requirements. In particular, watch out for overfull hboxes, which can result in
text appearing outside the margin.

