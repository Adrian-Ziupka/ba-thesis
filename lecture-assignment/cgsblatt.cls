\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgsblatt}

\LoadClass[10pt,a4paper]{article}

\RequirePackage[top=2.5cm, bottom=2.5cm, left=3cm, right=3cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage[american]{babel}
\RequirePackage{parskip}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[bookmarks=false,colorlinks=true,urlcolor=black,linkcolor=black]{hyperref}
\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{tabularx}
\RequirePackage{textcomp}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{csquotes}
\RequirePackage{subcaption}
\RequirePackage{accsupp}
%\RequirePackage[usenames,dvipsnames]{xcolor}

\titleformat{\section}{\normalfont\large\sffamily\bfseries}{Task~\theexercise.\thesection:}{.5em}{}
%\titleformat{name=\section, numberless}{\normalfont\large\sffamily\bfseries}{}{0pt}{}
\titlelabel{Task~\theexercise.\thesection:\quad}\titlespacing{\section}{-.5cm}{*4}{*1}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\sffamily\footnotesize \@title}
\fancyhead[C]{\sffamily\footnotesize \@date{} -- \@subtitle}
\fancyhead[R]{\sffamily\footnotesize Page \thepage}
\renewcommand{\headrulewidth}{0.5pt}
%\fancyfoot[C]{\sffamily\scriptsize Digitale oder maschinelle Vervielfältigung dieses Aufgabenzettels ist nicht erlaubt.}
\fancyheadoffset[L,R]{0.5cm}

\newcommand{\vecThree}[3]{{\begin{pmatrix}#1&#2&#3\end{pmatrix}}^T}
\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\labelenumi}{\theenumi)}
\renewcommand{\theenumii}{\roman{enumii}}
\renewcommand{\labelenumii}{\theenumii)}

\thispagestyle{empty}

\gdef\@subtitle{}
\def\subtitle#1{\gdef\@subtitle{#1}}

\lstset{basicstyle=\tt}

\let\cgs@origand\and

\renewcommand{\maketitle}{%
    \vspace*{-2cm}
    \hspace{-0.5cm}\makebox[0pt][l]{\begin{minipage}[t]{16cm}%
        \sffamily\bfseries%
        \begin{minipage}[t]{9.5cm}%
            \vspace{4pt}\raggedright%
            {\LARGE\@title}\\[4pt]
            {\@date{} -- \@subtitle}
        \end{minipage}%
        \hfill%
        \begin{minipage}[t]{6.8cm}%
            \raggedleft%
            \begin{minipage}[t]{5.8cm}%
                \vspace{6pt}Hasso Plattner Institute\\[-1pt]Computer Graphics Systems Group%
            \end{minipage}%
            \begin{minipage}[t]{1cm}%
                \vspace{0pt}\vspace{0pt}\includegraphics[width=1cm]{hpilogo}%
            \end{minipage}
            \par\vspace{6pt}
            \begin{minipage}[t]{7.5cm}
                \raggedleft\footnotesize\mdseries%
                \let\and\par%
                {\@author}
                \let\and\cgs@origand%
            \end{minipage}
        \end{minipage}
    \end{minipage}}
    \vspace{0.25cm}}

\definecolor{hpi@blue}{RGB}{  0,122,158}
\definecolor{hpi@red} {RGB}{177,  6, 58}
\newcommand{\blueify}{\textcolor{hpi@blue}}
\newcommand{\redify}{\textcolor{hpi@red}}

% code style for glsl

\definecolor{codeKeyword} {rgb}{0.00, 0.00, 1.00} 
\definecolor{codeComment} {rgb}{0.00, 0.50, 0.00} 
\definecolor{codeBkgnd}   {rgb}{0.92, 0.92, 0.92} 
\definecolor{codeFrame}   {rgb}{0.88, 0.88, 0.88} 

\definecolor{codeKeyword1}{rgb}{0.00, 0.00, 0.75}
\definecolor{codeKeyword2}{rgb}{0.50, 0.00, 0.00}
\definecolor{codeKeyword3}{rgb}{0.13, 0.43, 0.52}
\definecolor{codeKeyword4}{rgb}{0.40, 0.40, 0.40}


\definecolor{lightblue}  {rgb}{0.17, 0.57, 0.69}
\definecolor{darkgreen}  {rgb}{0.00, 0.50, 0.00}
\definecolor{lightgrey}  {rgb}{0.66, 0.66, 0.66}

\definecolor{sublimeblack}{RGB}{ 39, 40, 34}
\definecolor{sublimegray} {RGB}{173,173,166}
\definecolor{sublimewhite}{RGB}{248,248,242}

% This ensures numbers are not copied, but leading spaces are copied, as taken from
% http://tex.stackexchange.com/a/30310

\newcommand{\noncopynumber}[1]{%
    \BeginAccSupp{method=escape,ActualText={}}%
    #1%
    \EndAccSupp{}%
}


\makeatletter
\def\lst@outputspace{{\ifx\lst@bkgcolor\empty\color{white}\else\lst@bkgcolor\fi\lst@visiblespace}}
\makeatother


\lstdefinelanguage{Bash}
{
    morecomment=[l]{> }
,   morecomment=[l]{$ }
}

\lstdefinestyle{Bash}
{
    basicstyle       = 
    \ttfamily\color{sublimewhite}
    \lst@ifdisplaystyle\scriptsize\fi %inline code should have normal font size
,   backgroundcolor  = \color{sublimeblack}
,   rulecolor        = \color{black}
,   numberbychapter  = true
,   numbersep        = 8pt
,   tabsize          =  4          
,   numbers          = left
,   numberstyle      = \tiny\noncopynumber
,   frame            = single
,   framesep         =  4pt
,   xleftmargin=\parindent
,   xleftmargin      = 16pt
,   framexleftmargin = 16pt
,   abovecaptionskip = 0pt
,   stepnumber       = 1
,   columns          = flexible
,   keepspaces       = true
,   belowcaptionskip = 0pt,
,   belowskip        = 0pt,
,   commentstyle     = \color{sublimegray},
}
