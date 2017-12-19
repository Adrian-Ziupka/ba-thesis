cgsthesis Template
==================

Dependencies
------------

1. Current LaTeX distribution, using the following packages
    1. xcolor
    2. inputenc
    3. srchack
    4. srcpage
    5. babel
    6. amsmath
    7. amsthm
    8. printlen
    9. translations
    10. fontenc
    11. lmodern
    12. inconsolata
    13. amsfonts
    14. mathrsfs
    15. textcomp
    16. math tools
    17. graphicx
    18. url
    19. hyperref
    20. xspace
    21. afterpage
    22. ulem
    23. csquotes
    24. extdash
    25. booktabs
    26. listings
    27. cleveref
    28. caption
    29. tikz
    30. todonotes
2. LaTeX Biber
    1. biblatex

Optional Dependencies
---------------------

* microtype
* jtimesnew
* mathpazo
* helvet
* mathdesign
* newtxtext, newtxmath
* libertine
* beramono
* showframe

Install Dependencies
--------------------

Linux:
```
sudo add-apt-repository ppa:jonathonf/texlive-2017
sudo apt-get update
sudo apt-get -y install texlive texlive-bibtex-extra texlive-fonts-extra texlive-extra-utils texlive-latex-extra texlive-xetex texlive-generic-extra texlive-science texlive-humanities texlive-lang-german
```

Build Instructions
------------------

* Either, use the `build.sh` bash script:
```bash
pdflatex -interaction=nonstopmode foo-thesis.tex\
    && biber foo-thesis\
    && pdflatex -interaction=nonstopmode foo-thesis.tex\
    && pdflatex -interaction=nonstopmode foo-thesis.tex
```
* Or, use your favorite LaTeX IDE
