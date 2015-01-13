\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesPackage{arcpubs}[2013/02/07 LaTeX package for to create a list of  publications for Australian Research Council grant applications]

\usepackage{textcomp}
\usepackage[utf8]{inputenc}

\RequirePackage[backend=biber, url=false, doi=false, isbn=false, style=phys, biblabel=brackets, sorting=ydnt, texencoding=utf8,
defernumbers=true]{biblatex}

\RequirePackage[normalem]{ulem} %for \uline

% underline authors which match the given last name
\DeclareNameFormat{author}{%
\ifthenelse{\equal{#1}{\filterlastname}}%
    {\textbf{\uline{\ifblank{#4}{}{#4\space}#1}}}%
    {\ifblank{#4}{}{#4\space}#1}%
\ifthenelse{\value{listcount}<\value{liststop}}%
    {\addcomma\space}
    {}}

% filter to only include items where one author has the give last name
\DeclareBibliographyCategory{byname}

\DeclareIndexNameFormat{byname}{% Test could be refined
  \ifboolexpr{ test {\ifdefstring{\filterlastname}{#1}}}
    {\addtocategory{byname}{\thefield{entrykey}}}
    {}}

\defbibcheck{recent}{}

\newcommand{\StartYear}[1]{
% filter to only include items after the given year
\defbibcheck{recent}{
\ifboolexpr{ not test {\iffieldint{year}} or test {\ifnumless{\thefield{year}}{#1}}
}
{\skipentry}
{}
}
}

\newcommand{\Author}[1]{\newcommand{\filterlastname}{#1}}


\DeclareBibliographyCategory{relevant}

% Inform biblatex that all relevant citations deserve
% special treatment, while all others do not
\AtEveryBibitem{%
  \ifcategory{relevant}%
    {* }%
    {}%
}

% get rid of the annoying word "In:" for the numeric biblatex style
\renewbibmacro{in:}{}
  
% get rid of the language entry
\AtEveryBibitem{\clearlist{language}}

\AtDataInput{%
  \indexnames[byname][1-99]{author}}

% avoid trying to justify text, as this can lead to overfull boxes
\renewcommand*{\bibfont}{\raggedright}

\newcommand{\showbooks}{\printbibliography[title={Books}, type=book, category=byname, check=recent]}
\newcommand{\showchapters}{\printbibliography[title={Book Chapters}, type=inbook, category=byname, check=recent, heading=subbibliography]}
\newcommand{\showarticles}{\printbibliography[title={Journal Articles}, type=article, category=byname, check=recent, heading=subbibliography]}
\newcommand{\showproceedings}{\printbibliography[title={Conference Proceedings}, type=inproceedings, category=byname, check=recent, heading=subbibliography]}

\LoadClass[a4paper,12pt]{article}

% Use San-serif headings
\usepackage{sectsty}
\sectionfont{\fontsize{12}{15}\bfseries\selectfont}
\subsectionfont{\fontsize{12}{15}\selectfont}


% minimum margin size is 0.5cm
\RequirePackage[margin=0.5cm]{geometry}

\pagestyle{empty}

\endinput