% customarticle.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{customarticle}[2024/09/15 Custom LaTeX class based on article]

% Load the base article class with options
\LoadClass[a4paper,11pt]{article}

% Geometry package for page layout
\RequirePackage[a4paper,margin=0.6in]{geometry}

% Essential packages
\RequirePackage[utf8]{inputenc} % Input encoding (utf-8)
\RequirePackage{setspace} % Line spacing
\RequirePackage{enumitem} % Control over list spacing
\RequirePackage{xhfill} % Horizontal fill commands (e.g., xrfill)
\RequirePackage{lastpage} % Reference to the last page in the document
\RequirePackage{titlesec} % Control section titles
\RequirePackage{longtable} % Long tables that span pages
\RequirePackage[tableposition=below]{caption} % Control captions for figures and tables
\captionsetup[longtable]{skip=1em} % Adjust space before longtable caption
\RequirePackage{subcaption} % Subfigure and subtable captions
\RequirePackage{graphicx} % Graphics inclusion
\RequirePackage{xcolor} % Color management
\RequirePackage{listings} % Code listing formatting
\RequirePackage{ragged2e} % Ragged-right text alignment
\RequirePackage{hyperref} % Hyperlinks
\RequirePackage{amssymb} % Additional math symbols
\RequirePackage{outlines} % Outlines and nested lists
\RequirePackage{bm} % Bold math symbols
\RequirePackage{float} % Enhanced control over float placement
\RequirePackage{multicol} % Multiple columns
\RequirePackage{amsthm} % Math package

% Hyperlink settings
\hypersetup{
    colorlinks=true, % Use colored links
    allcolors=blue   % Set link color to blue
}

%% Code style
\RequirePackage{lmodern} % Latin Modern font
\RequirePackage[T1]{fontenc} % Output encoding
\renewcommand{\ttdefault}{txtt} % Monospaced font setup

\lstdefinestyle{mystyle}{  
    commentstyle=\color{gray}, % Comments in gray
    keywordstyle=\color{magenta}, % Keywords in magenta
    stringstyle=\color{violet}, % Strings in violet
    basicstyle=\ttfamily, % Monospaced text
    upquote=true, % Ensure proper quotes
    breakatwhitespace=false, % Disable breaking at spaces
    breaklines=true, % Enable line breaking
    captionpos=b, % Caption position (bottom)
    showspaces=false, % Do not show spaces
    showstringspaces=false, % Do not show spaces in strings
    showtabs=false, % Do not show tabs
    tabsize=4 % Set tab size to 4 spaces
}

% Apply the style for listings
\lstset{style=mystyle}

%% Command for horizontal rule after section title
\newcommand\ruleafter[1]{#1~\xrfill[.5ex]{1pt}}

%% Section and subsection title format with trailing line
\titleformat{\section}
  {\large\bfseries} % Large, bold section titles
  {\thesection $|$} % Section number followed by pipe
  {0.1cm} % Space between number and title
  {\ruleafter} % Add trailing rule after title

\titleformat{\subsection}
  {\bfseries} % Bold subsection titles
  {\thesubsection} % Subsection number
  {0.1cm} % Space between number and title
  {}

%% Adjust spacing before and after section titles
\titlespacing*{\section}
  {0pt} % No left indent
  {0.4cm} % Space before section title
  {0.4cm} % Space after section title

%% Compact list spacing
\setlist{nosep} % No additional vertical spacing in lists
\setlist[itemize]{noitemsep, topsep=0pt} % Tight spacing for itemize lists

%% Define shaded box environment using tcolorbox
\RequirePackage{tcolorbox}
\newtcolorbox{shadedbox}{
    colback=gray!10!white, % Background color (light gray)
    colframe=gray!90!black, % Border color (dark gray)
    boxrule=0.5pt, % Thickness of the border
    arc=3mm, % Rounded corners
    left=3mm, % Padding on the left
    right=3mm, % Padding on the right
    top=3mm, % Padding at the top
    bottom=3mm % Padding at the bottom
}

%% Bibliography
\RequirePackage{csquotes}
\RequirePackage[english]{babel}
\RequirePackage[backend=biber,sorting=ydnt,firstinits=true,uniquename=false,natbib=true,defernumbers=true,isbn=false,url=false,eprint=false]{biblatex} 
% \addbibresource{myref.bib}
\renewbibmacro{in:}{}
\AtEveryBibitem{%
  \clearfield{month}%
  \clearfield{day}%
}

