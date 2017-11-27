\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgsthesis}[10/10/2012 CGS Thesis class by J.E. Kyprianidis and 2017 by Sören Discher and Willy Scheibel]

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

% Degrees
\newif\ifcgs@bsc
\newif\ifcgs@msc
\newif\ifcgs@drrernat
\newif\ifcgs@dring

% Programs
\newif\ifcgs@computerscience
\newif\ifcgs@itse
\newif\ifcgs@dataengineering

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

% Degrees
\DeclareOption{bsc}{\cgs@bsctrue}
\DeclareOption{msc}{\cgs@msctrue}
\DeclareOption{drrernat}{\cgs@drrernattrue}
\DeclareOption{dring}{\cgs@dringtrue}

% Programs
\DeclareOption{computerscience}{\cgs@computersciencetrue}
\DeclareOption{itse}{\cgs@itsetrue}
\DeclareOption{dataengineering}{\cgs@dataengineeringtrue}

\ProcessOptions\relax

\IfFileExists{cgsthesis.cfg}{\input{cgsthesis.cfg}}

\ifcgs@tenpt
    \LoadClass[fontsize=10pt,chapterprefix=true,headsepline=true,
               bibliography=totoc,listof=totoc]{scrbook}
    \let\latex@xfloat=\@xfloat
    \def\@xfloat #1[#2]{%
        \latex@xfloat #1[#2]%
        \linespread{1.0999}\selectfont}
    %\linespread{1.1333}\selectfont
    \linespread{1.1666}\selectfont
    \newcommand{\cgs@width}{5.25in}
\else
    \LoadClass[fontsize=11pt,chapterprefix=true,headsepline=true,
               bibliography=totoc,listof=totoc]{scrbook}
    \let\latex@xfloat=\@xfloat
    \def\@xfloat #1[#2]{%
        \latex@xfloat #1[#2]%
        \linespread{1.0666}\selectfont}
    \linespread{1.0666}\selectfont
    \newcommand{\cgs@width}{147mm}
\fi

\RequirePackage[utf8]{inputenc}
\RequirePackage{scrhack}
\RequirePackage{scrpage2}
\RequirePackage[ngerman,english]{babel}
\RequirePackage{amsmath,amsthm}
\RequirePackage{printlen}
\RequirePackage{translations}

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
\RequirePackage{textcomp}
\RequirePackage{math tools}
\RequirePackage{graphicx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[hyphens]{url}
\RequirePackage[colorlinks=true,citecolor=Blue,linkcolor=Black,urlcolor=Blue,bookmarks=false]{hyperref}
\RequirePackage{xspace}
\RequirePackage{afterpage}
\RequirePackage[normalem]{ulem}
\RequirePackage{csquotes}
\RequirePackage[shortcuts]{extdash}
\RequirePackage{booktabs}
\RequirePackage{listings}
\RequirePackage[capitalise,noabbrev,nameinlink]{cleveref}
\RequirePackage[normal,labelfont=bf,textfont=it,font=small]{caption}
\RequirePackage[labelformat=simple,labelfont=md,textfont=it,font=scriptsize,
                justification=centering]{subcaption}
\renewcommand\thesubfigure{(\alph{subfigure})}
\advance\textfloatsep 8pt
\def\lst@MakeCaption#1{% #1 is `t' or `b'
  \begingroup
  %\ifdim\hsize>\linewidth
  %  \hsize\linewidth
  %\fi
    \caption@setposition{#1}%
    \caption@iftop{%
      \@tempdima\belowcaptionskip
      \belowcaptionskip\abovecaptionskip
      \abovecaptionskip\@tempdima}{}%
    \caption@setup{rule=0}%
    \caption@setoptions{lstlisting}%
    \caption@setautoposition{#1}%
    \caption@begin{lstlisting}%
      \caption@ORI@lst@MakeCaption{#1}%
    \caption@end
  \endgroup}%
\fi

\topskip=\baselineskip
\ifcgs@tight
    \RequirePackage[papersize={6.5in,10in},
                text={\cgs@width,220mm},centering,
                head=14pt,headsep=16pt,foot=27pt]{geometry}
\else\ifcgs@afoursmall
    \RequirePackage[papersize={21cm,11in},
                text={\cgs@width,220mm},top=27mm,hcentering,
                head=14pt,headsep=16pt,foot=27pt]{geometry}
\else
    \RequirePackage[a4paper, %papersize={21cm,11in},
                text={\cgs@width,220mm},top=34mm,hcentering,
                head=14pt,headsep=16pt,foot=27pt]{geometry}
\fi\fi
\setlength\parindent{2em}
\setlength{\headheight}{1.1\baselineskip}
%\parskip=2pt plus 2pt minus 1pt

\addtokomafont{disposition}{\cgs@dispfamily}
\renewcommand{\chapterformat}{\chapappifchapterprefix{\space}\thechapter\enskip}
\renewcommand{\size@chapter}{\Huge}
\renewcommand{\size@chapterprefix}{\large}
\renewcommand{\chapterheadstartvskip}{\vspace*{50\p@}}
\renewcommand{\chapterheadendvskip}{\vskip40pt}
\renewcommand*{\@@makechapterhead}[1]{\chapterheadstartvskip
  {%
    \setlength{\parindent}{\z@}\setlength{\parfillskip}{\fill}%
    \normalfont\sectfont\nobreak\size@chapter{}%
    \if@chapterprefix
      \let\@tempa\raggedsection
    \else
      \let\@tempa\@hangfrom
    \fi
    \@tempa{\ifnum \c@secnumdepth >\m@ne%
        \if@mainmatter
          \if@chapterprefix
            \expandafter\size@chapterprefix
          \else
            \expandafter\size@chapter
          \fi
          {\chapterformat}%
          \if@chapterprefix
            \size@chapterprefix{}\endgraf\nobreak
          \fi
        \fi
      \fi
    }%
    {\raggedsection \interlinepenalty \@M \size@chapter{#1}\par}}%
  \nobreak\chapterheadendvskip
}
\renewcommand*{\@@makeschapterhead}[1]{%
  \chapterheadstartvskip%
  {\normalfont\sectfont\nobreak\size@chapter{}%
    \setlength{\parindent}{\z@}\setlength{\parfillskip}{\fill}%
    \centering \interlinepenalty\@M \size@chapter{#1}\par}%
  \nobreak\chapterheadendvskip%
}
\setkomafont{pageheadfoot}{\cgs@dispfamily\footnotesize}
\pagestyle{scrheadings}
\clearscrheadfoot
\ihead{\headmark}
\ohead{\pagemark}
\cfoot[\pagemark]{}
\setheadsepline{.4pt}
\renewcommand*{\chaptermarkformat}{\chapappifchapterprefix{\ }\thechapter. \ }
\renewcommand*{\sectionmarkformat}{\thesection. \ }
\renewcommand*{\subsectionmarkformat}{\thesubsection. \ }

\setkomafont{dictumtext}{\itshape\small}
\setkomafont{dictumauthor}{\normalfont}
\renewcommand*\dictumwidth{0.6\linewidth}
\renewcommand*\dictumauthorformat[1]{--- #1}
\renewcommand*\dictumrule{}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {1.5ex \@plus0.5ex \@minus0.5ex}%
  {-1em}%
  {\raggedsection\normalfont\sectfont\nobreak\size@paragraph}%
}

\DeclareTranslationFallback {cgs@logo}{graphics/logo_black}
\DeclareTranslation{ngerman}{cgs@logo}{graphics/logo_black}
\DeclareTranslation{english}{cgs@logo}{graphics/logo_black}
\gdef\@logo{\GetTranslation{cgs@logo}}

\DeclareTranslationFallback {cgs@date}{\the\date}
\DeclareTranslation{ngerman}{cgs@date}{\ifcase\month
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
\DeclareTranslation{english}{cgs@date}{\the\date}
\gdef\@date{\edef\foo{\GetTranslation{cgs@date}}\show\foo}

\gdef\@place{Potsdam}
\def\place#1{\gdef\@place{#1}}

\DeclareTranslationFallback {cgs@supervision}{Supervision:\\}
\DeclareTranslation{ngerman}{cgs@supervision}{Aufgabenstellung und Anleitung:\\}
\DeclareTranslation{english}{cgs@supervision}{Supervision:\\}

\DeclareTranslationFallback {cgs@program}{Invalid Program}
\DeclareTranslationFallback {cgs@degree}{Invalid Degree}
\DeclareTranslationFallback {cgs@thesiscat}{Invalid Thesis Category}
\DeclareTranslationFallback {cgs@inprogram}{in}

\DeclareTranslationFallback {cgs@fordegree}{in partial fulfillment for the academic degree}
\DeclareTranslation{ngerman}{cgs@fordegree}{zur Erlangung des akademischen Grades}
\DeclareTranslation{english}{cgs@fordegree}{in partial fulfillment for the academic degree}

% Programs
\ifcgs@computerscience
  \DeclareTranslation{ngerman}{cgs@program}{Informatik}
  \DeclareTranslation{english}{cgs@program}{Computer Science}
\else
\ifcgs@itse
  \DeclareTranslation{ngerman}{cgs@program}{IT-Systems Engineering}
  \DeclareTranslation{english}{cgs@program}{IT Systems Engineering}
\else
\ifcgs@dataengineering
\DeclareTranslation{ngerman}{cgs@program}{Data Engineering}
\DeclareTranslation{english}{cgs@program}{Data Engineering}
\fi\fi\fi

% Degrees
\ifcgs@bsc
\DeclareTranslation{ngerman}{cgs@degree}{\enquote{Bachelor of Science}\\(B.Sc.)}
\DeclareTranslation{english}{cgs@degree}{\enquote{Bachelor of Science}\\(B.Sc.)}
\DeclareTranslation{ngerman}{cgs@thesiscat}{Bachelorarbeit}
\DeclareTranslation{english}{cgs@thesiscat}{Bachelor's Thesis}
\DeclareTranslation{ngerman}{cgs@inprogram}{im Studiengang}
\DeclareTranslation{english}{cgs@inprogram}{in}
\else
\ifcgs@msc
\DeclareTranslation{ngerman}{cgs@degree}{\enquote{Master of Science}\\(M.Sc.)}
\DeclareTranslation{english}{cgs@degree}{\enquote{Master of Science}\\(M.Sc.)}
\DeclareTranslation{ngerman}{cgs@thesiscat}{Masterarbeit}
\DeclareTranslation{english}{cgs@thesiscat}{Master's Thesis}
\DeclareTranslation{ngerman}{cgs@inprogram}{im Studiengang}
\DeclareTranslation{english}{cgs@inprogram}{in}
\else
\ifcgs@drrernat
\DeclareTranslation{ngerman}{cgs@degree}{\enquote{doctor rerum naturalium}\\(Dr.\ rer.\ nat.)}
\DeclareTranslation{english}{cgs@degree}{\enquote{doctor rerum naturalium}\\(Dr.\ rer.\ nat.)}
\DeclareTranslation{ngerman}{cgs@thesiscat}{Dissertation}
\DeclareTranslation{english}{cgs@thesiscat}{Dissertation}
\DeclareTranslation{ngerman}{cgs@inprogram}{in der Wissenschaftsdisziplin}
\DeclareTranslation{english}{cgs@inprogram}{in}
\else
\ifcgs@dring
\DeclareTranslation{ngerman}{cgs@degree}{\enquote{Doktor der Ingenieurwissenschaften}\\(Dr.-Ing.)}
\DeclareTranslation{english}{cgs@degree}{\enquote{Doktor der Ingenieurwissenschaften}\\(Dr.-Ing.)}
\DeclareTranslation{ngerman}{cgs@thesiscat}{Dissertation}
\DeclareTranslation{english}{cgs@thesiscat}{Dissertation}
\DeclareTranslation{ngerman}{cgs@inprogram}{in der Wissenschaftsdisziplin}
\DeclareTranslation{english}{cgs@inprogram}{in}
\fi\fi\fi\fi

\DeclareTranslationFallback {cgs@submittedby}{submitted by}
\DeclareTranslation{ngerman}{cgs@submittedby}{vorgelegt von}
\DeclareTranslation{english}{cgs@submittedby}{submitted by}

\DeclareTranslationFallback {cgs@affiliation}{Invalid Affiliation}
\DeclareTranslation{ngerman}{cgs@affiliation}{Hasso-Plattner-Institut \textbar{} Digital Engineering Fakult\"at\\Universit\"at Potsdam}
\DeclareTranslation{english}{cgs@affiliation}{Hasso Plattner Institute \textbar{} Faculty of Digital Engineering\\University of Potsdam}

\subject{%
	\GetTranslation{cgs@thesiscat}\\
	\GetTranslation{cgs@fordegree}\\
	\GetTranslation{cgs@degree}\\
	\GetTranslation{cgs@inprogram} \GetTranslation{cgs@program}\\
	\vspace{1em}
	\GetTranslation{cgs@affiliation}\\
	\vfill
	\GetTranslation{cgs@submittedby}}

\renewcommand\maketitle{
    \begin{titlepage}
        \centering\large\sffamily%
        \ifx\@logo\@empty
        \else
            \makebox[\textwidth]{\includegraphics{\@logo}}
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
        {\vfill\GetTranslation{cgs@supervision}\@publishers\par}
        \fi
        {\normalsize\vfill
        \@place,\\
        \@date\par}
    \end{titlepage}}
