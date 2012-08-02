\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgsthesis}[08/02/2012 CGS Thesis class by J.E. Kyprianidis]

\newif\ifcgs@tight
\newif\ifcgs@afoursmall
\newif\ifcgs@basic
\newif\ifcgs@tenpt
\newif\ifcgs@nofonts
\newif\ifcgs@palatino
\newif\ifcgs@utopia
\newif\ifcgs@charter
\newif\ifcgs@times
\newif\ifcgs@timesNR
\newif\ifcgs@libertine

\DeclareOption{tight}{\cgs@tighttrue}
\DeclareOption{a4small}{\cgs@afoursmalltrue}
\DeclareOption{basic}{\cgs@basictrue}
\DeclareOption{10pt}{\cgs@tenpttrue}
\DeclareOption{nofonts}{\cgs@nofontstrue}
\DeclareOption{palatino}{\cgs@palatinotrue}
\DeclareOption{utopia}{\cgs@utopiatrue}
\DeclareOption{charter}{\cgs@chartertrue}
\DeclareOption{libertine}{\cgs@libertinetrue}
\DeclareOption{times}{\cgs@timestrue}
\DeclareOption{timesNR}{\cgs@timesNRtrue}
\ProcessOptions\relax

\IfFileExists{cgsthesis.cfg}{\input{cgsthesis.cfg}}

\ifcgs@tenpt
    \LoadClass[fontsize=10pt,chapterprefix=true,headsepline=true,bibliography=totoc,listof=totoc]{scrbook}
    \let\latex@xfloat=\@xfloat
    \def\@xfloat #1[#2]{%
        \latex@xfloat #1[#2]%
        \linespread{1.0666}\selectfont}
    \linespread{1.1333}\selectfont
    %\linespread{1.1666}\selectfont
\else
    \LoadClass[fontsize=11pt,chapterprefix=true,headsepline=true,bibliography=totoc,listof=totoc]{scrbook}
    \let\latex@xfloat=\@xfloat
    \def\@xfloat #1[#2]{%
        \latex@xfloat #1[#2]%
        \linespread{1.0666}\selectfont}
    \linespread{1.0666}\selectfont
\fi

\RequirePackage{scrhack}
\RequirePackage{babel}
\RequirePackage{amsmath,amsthm}

\newcommand{\cgs@dispfamily}{\sffamily}

\ifcgs@nofonts\else
\ifcgs@timesNR
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage[optima,lucida]{jtimesnew}
    \RequirePackage[mtphrb,mtpccal,mtpscr,subscriptcorrection]{mtpro2}
\else
\ifcgs@palatino
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage[scaled=1.03]{inconsolata}
    \RequirePackage[osf]{mathpazo}
    \renewcommand*\sfdefault{uop} %http://www.ctan.org/tex-archive/fonts/urw/classico/
\else
\ifcgs@utopia
    \RequirePackage{microtype}
    \RequirePackage[scaled=0.92]{helvet}
    \RequirePackage[utopia,ttscaled=false]{mathdesign}
    \RequirePackage{inconsolata}
\else
\ifcgs@charter
    \RequirePackage{microtype}
    \RequirePackage[charter,ttscaled=false]{mathdesign}
    \RequirePackage[scaled]{berasans}
    \RequirePackage{inconsolata}
\else
\ifcgs@times
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{newtxtext}
    \RequirePackage{newtxmath}
    \let\mathscr\mathcal
\else
\ifcgs@libertine
    \RequirePackage[T1]{fontenc}
    \RequirePackage[nf]{libertine}
    \RequirePackage{textcomp}
    \RequirePackage[scaled=.85]{beramono}
    \RequirePackage[libertine,cmintegrals,cmbraces]{newtxmath}
    \renewcommand*{\rmdefault}{fxlj}
    \def\libertine{\fontfamily{fxlj}\selectfont}
    \let\mathscr\mathcal
\else
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{lmodern}
    \RequirePackage{inconsolata}
    \RequirePackage{amsfonts}
    \RequirePackage{mathrsfs}
\fi\fi\fi\fi\fi\fi\fi

\ifcgs@basic\else
\RequirePackage{mathtools}
\RequirePackage{graphicx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[colorlinks=true,citecolor=Blue,linkcolor=black,urlcolor=Blue,bookmarks=false]{hyperref}
\RequirePackage{xspace}
\RequirePackage[normalem]{ulem}
\RequirePackage{csquotes}
\RequirePackage{booktabs}
\RequirePackage{listings}
\RequirePackage[capitalise,noabbrev,nameinlink]{cleveref}
\RequirePackage[normal,labelfont=bf,textfont=it,font=small,skip=\medskipamount]{caption}
\RequirePackage[labelformat=simple,labelfont=md,textfont=it,font=scriptsize,
                skip=\medskipamount,justification=centering]{subcaption}
\renewcommand\thesubfigure{(\alph{subfigure})}
\fi

\topskip=\baselineskip
\ifcgs@tight
    \RequirePackage[papersize={6.5in,10in},
                text={5.75in,9in},centering,includeheadfoot,
                head=11pt,headsep=16pt,foot=27pt]{geometry}
\else\ifcgs@afoursmall
    \RequirePackage[papersize={21cm,11in},
                text={5.75in,9in},centering,includeheadfoot,
                head=11pt,headsep=16pt,foot=27pt]{geometry}
\else
    \RequirePackage[a4paper, %papersize={21cm,11in},
                text={5.75in,9in},centering,includeheadfoot,
                head=11pt,headsep=16pt,foot=27pt]{geometry}
\fi\fi
\setlength\parindent{2em}
%\parskip=2pt plus 2pt minus 1pt

\addtokomafont{disposition}{\cgs@dispfamily}
\RequirePackage{fncychap}
\ChNameVar{\large\bfseries\cgs@dispfamily}
\ChNumVar{\large\bfseries\cgs@dispfamily}
\ChTitleVar{\Huge\bfseries\cgs@dispfamily}
\renewcommand{\DOCH}{%
    \CNV\FmN{\chapapp}\space \CNoV\thechapter\par\nobreak}
\renewcommand{\DOTI}[1]{%
    \CTV\FmTi{#1}\par\nobreak
    \vskip 40pt}
\renewcommand{\DOTIS}[1]{%
    {\CTV\FmTi{\hfill#1\hfill}}\par\nobreak
    \vskip 0pt}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancypagestyle{plain}{\fancyhf{}%
    \fancyfoot[C]{\rmfamily\scriptsize\thepage}%
    \renewcommand\headrulewidth{0pt}}
\fancyhf{}%
\fancyhead[RO,LE]{\cgs@dispfamily\footnotesize\thepage}%
\fancyhead[LO]{\cgs@dispfamily\footnotesize\nouppercase{\rightmark}}%
\fancyhead[RE]{\cgs@dispfamily\footnotesize\nouppercase{\leftmark}}%
\renewcommand\headrulewidth{0.4pt}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {1.5ex \@plus0.5ex \@minus0.5ex}%
  {-1em}%
  {\raggedsection\normalfont\sectfont\nobreak\size@paragraph}%
}

\gdef\@logo{}
\def\logo#1{\gdef\@logo{#1}}

\gdef\@date{%
    \ifcase\month
    \or Januar%
    \or Februar%
    \or M{\"a}rz%
    \or April%
    \or Mai%
    \or Juni%
    \or Juli%
    \or August%
    \or September%
    \or Oktober%
    \or November%
    \or Dezember%
    \fi\space\number\year}
\gdef\@place{Potsdam}
\def\place#1{\gdef\@place{#1}}

\renewcommand\maketitle{
    \begin{titlepage}
        \centering\large\sffamily%
        \ifx\@logo\@empty
        \else
            \includegraphics{\@logo}
        \fi
        \vfill
        {\Huge\textbf{\@title}\par}
        \ifx\@subtitle\@empty
        \else
            \vskip 2ex
            {\Large\textbf{\@subtitle}\par}
        \fi
        \vfill
        {\@subject\par}
        {\Large\textbf{\@author}\par}
        \ifx\@publishers\@empty
        \else
        {\vfill\@publishers\par}
        \fi
        {\normalsize\vfill
        \@place,\\
        \@date\par}
    \end{titlepage}}
