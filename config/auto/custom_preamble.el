;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "custom_preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "a4paper" "margin=0.6in") ("inputenc" "utf8") ("setspace" "") ("enumitem" "") ("xhfill" "") ("lastpage" "") ("titlesec" "") ("longtable" "") ("caption" "tableposition=below") ("subcaption" "") ("graphicx" "") ("xcolor" "") ("listings" "") ("ragged2e" "") ("hyperref" "") ("amssymb" "") ("outlines" "") ("bm" "") ("float" "") ("multicol" "") ("lmodern" "") ("fontenc" "T1") ("fancyhdr" "") ("babel" "english") ("amsmath" "") ("csquotes" "")))
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
    "csquotes")
   (TeX-add-symbols
    '("ruleafter" 1)))
 :latex)

