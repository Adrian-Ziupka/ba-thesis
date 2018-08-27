\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgsthesis}[27/08/2018 CGS Thesis Class]
% 2012 by J.E. Kyprianidis
% 2017 by Sören Discher and Willy Scheibel

% Logo
\newif\ifcgs@coloredlogo
\newif\ifcgs@sizeadjustedlogo

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

% Page Margins
\newif\ifcgs@showmargins

% Logo
\DeclareOption{coloredlogo}{\cgs@coloredlogotrue}
\DeclareOption{sizeadjustedlogo}{\cgs@sizeadjustedlogotrue}

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

% Page Margins
\DeclareOption{showmargins}{\cgs@showmarginstrue}

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
    %\newcommand{\cgs@width}{5.25in} % former 10pt width
    \newcommand{\cgs@width}{147mm}
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

\RequirePackage[usenames,dvipsnames]{xcolor}
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
\RequirePackage[hyphens]{url}
\RequirePackage[colorlinks=true,citecolor=blue,linkcolor=black,urlcolor=blue,bookmarks=false]{hyperref}
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
\RequirePackage{tikz}

\ifcgs@showmargins
  \RequirePackage{showframe}
\fi

\usetikzlibrary{calc}

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

\DeclareTranslationFallback {cgs@Faculty}{\uppercase{Faculty of Digital Engineering}}
\DeclareTranslation{ngerman}{cgs@Faculty}{\uppercase{Digital Engineering Fakultät}}
\DeclareTranslation{english}{cgs@Faculty}{\uppercase{Faculty of Digital Engineering}}

\DeclareTranslationFallback {cgs@group}{Computer Graphics Systems Group}
\DeclareTranslation{ngerman}{cgs@group}{Fachgebiet Computergrafische Systeme}
\DeclareTranslation{english}{cgs@group}{Computer Graphics Systems Group}

\ifcgs@coloredlogo
  \gdef\@logosuffix{cmyk}
\else
  \gdef\@logosuffix{black}
\fi

\gdef\@unilogosize{1.0}
\ifcgs@sizeadjustedlogo
  \gdef\@hpilogosize{0.42}
\else
  \gdef\@hpilogosize{1.0}
\fi

\gdef\@logo{
	\newlength{\cgs@logoheight}
	\setlength{\cgs@logoheight}{3.5em}
	\begin{tikzpicture}[]
	\node[anchor=east, inner sep=0pt, outer sep=0pt] at (\textwidth,0.0) (hpilogo) { \includegraphics[height=\@hpilogosize\cgs@logoheight]{graphics/hpi_logo_\@logosuffix} };
	\node[anchor=east, inner sep=0pt, outer sep=0pt] at ($(hpilogo.west)-(0.25,0.0)$) (unilogo) { \includegraphics[height=\@unilogosize\cgs@logoheight]{graphics/uni_logo_\@logosuffix} };
	\draw[line width=1pt] (0.0,0.0) -- ($(unilogo.west)-(0.25,0.0)$);
	\node[anchor=south west, yshift=4pt, inner sep=0pt, outer sep=0pt] at (0.0, 0.0) { \large\GetTranslation{cgs@Faculty} };
	\node[anchor=north west, yshift=-4pt, inner sep=0pt, outer sep=0pt] at (0.0, 0.0) { \large\GetTranslation{cgs@group} };
	\ifcgs@showmargins
	  \draw let \p{south}=(hpilogo.south) in (0.0,\y{south}) -- (\textwidth,\y{south});
	\fi
	\end{tikzpicture}
}

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
\DeclareTranslation{ngerman}{cgs@affiliation}{Hasso-Plattner-Institut // Digital Engineering Fakult\"at // Universit\"at Potsdam}
\DeclareTranslation{english}{cgs@affiliation}{Hasso Plattner Institute //  Faculty of Digital Engineering // University of Potsdam}

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
        \@logo
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

\DeclareTranslationFallback {cgs@statutorydeclarationtitle}{Statutory Declaration}
\DeclareTranslation{ngerman}{cgs@statutorydeclarationtitle}{Eidesstattliche Erklärung}
\DeclareTranslation{english}{cgs@statutorydeclarationtitle}{Statutory Declaration}

\DeclareTranslationFallback {cgs@placestring}{Place}
\DeclareTranslation{ngerman}{cgs@placestring}{Ort}
\DeclareTranslation{english}{cgs@placestring}{Place}

\DeclareTranslationFallback {cgs@datestring}{Date}
\DeclareTranslation{ngerman}{cgs@datestring}{Datum}
\DeclareTranslation{english}{cgs@datestring}{Date}

\DeclareTranslationFallback {cgs@signaturestring}{Signature}
\DeclareTranslation{ngerman}{cgs@signaturestring}{Unterschrift}
\DeclareTranslation{english}{cgs@signaturestring}{Signature}

\DeclareTranslationFallback {cgs@statutorydeclaration}{Invalid declaration}
\DeclareTranslation{ngerman}{cgs@statutorydeclaration}{
Ich erkläre hiermit an Eides statt, dass ich die vorliegende
Arbeit ohne unzulässige Hilfe Dritter und ohne Benutzung anderer
als der angegebenen Hilfsmittel angefertigt habe; die aus anderen
Quellen direkt oder indirekt übernommenen Daten und Konzepte sind
unter Angabe des Literaturzitats gekennzeichnet.
Diese Arbeit hat in gleicher oder ähnlicher Form noch keiner Prüfungsbehörde vorgelegen.
}
\DeclareTranslation{english}{cgs@statutorydeclaration}{
I declare that I have developed and written the enclosed thesis
completely by  myself, and have not used sources or means without declaration in the text. Any  thoughts from others or literal quotations are clearly marked. The Master Thesis was not used in the same or in a similar version to achieve an academic grading or is being  published elsewhere.
}

\newcommand{\printstatutorydeclaration}{
    \pagestyle{plain}
    
    \chapter*{\GetTranslation{cgs@statutorydeclarationtitle}}
    
    \GetTranslation{cgs@statutorydeclaration}
    
    \vspace{1.5cm}
    
    \noindent
    \begin{tabular}{p{0.4\linewidth}p{0.1\linewidth}p{0.4\linewidth}}
    	\@place, \@date &&\\
    	\cline{1-1}
    	\cline{3-3}
    	(\GetTranslation{cgs@placestring}, \GetTranslation{cgs@datestring})&&(\GetTranslation{cgs@signaturestring})
    \end{tabular}
}