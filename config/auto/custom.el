;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "custom"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "a4paper" "margin=0.6in") ("inputenc" "utf8") ("setspace" "") ("enumitem" "") ("xhfill" "") ("lastpage" "") ("titlesec" "") ("longtable" "") ("caption" "tableposition=below") ("subcaption" "") ("graphicx" "") ("xcolor" "") ("listings" "") ("ragged2e" "") ("hyperref" "") ("amssymb" "") ("outlines" "") ("bm" "") ("float" "") ("multicol" "") ("lmodern" "") ("fontenc" "T1") ("fancyhdr" "") ("babel" "english") ("amsmath" "") ("csquotes" "") ("biblatex" "doi=false" "isbn=false" "url=false" "eprint=false" "sortcites=true" "sorting=nyt" "style=ieee" "backend=biber")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "geometry"
    "inputenc"
    "setspace"
    "enumitem"
    "xhfill"
    "lastpage"
    "titlesec"
    "longtable"
    "caption"
    "subcaption"
    "graphicx"
    "xcolor"
    "listings"
    "ragged2e"
    "hyperref"
    "amssymb"
    "outlines"
    "bm"
    "float"
    "multicol"
    "lmodern"
    "fontenc"
    "fancyhdr"
    "babel"
    "amsmath"
    "csquotes"
    "biblatex")
   (TeX-add-symbols
    '("ruleafter" 1)
    "subject"
    "subtitle")
   (LaTeX-add-bibliographies
    "ref"))
 :latex)

