\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{cgsposter}[07/05/2014 CGS Poster class by Amir Semmo]
\LoadClassWithOptions{tikzposter}

\newcommand{\pdfauthor}[1]{\gdef\@ACMpdfauthor{#1}}

\newcommand{\@ACMkeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@ACMkeywords}{#1}}

%%%% SIGGRAPH citation style

\RequirePackage{amsmath}
\RequirePackage{lineno}
\RequirePackage[scaled=.92]{helvet}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage[labelfont=bf,textfont=it]{caption}
\RequirePackage{parskip}
\RequirePackage{multicol}

% no labels in bibliography.
\def\@biblabel#1{}

\newlength{\bibhang}
\setlength{\bibhang}{1em}

\newlength{\cgspostertitlesize}
\newlength{\cgspostertitlefontsize}
\setlength{\cgspostertitlesize}{70pt}
\setlength{\cgspostertitlefontsize}{60pt}

\def\thebibliography#1{%
	%\section*{%
	%  \refname\@mkboth{\sl\uppercase{\refname}}{\sl\uppercase{\refname}}}
	\small
	\list{\relax}{\setlength{\labelsep}{0em}
		\setlength{\itemindent}{-\bibhang}
		\setlength{\leftmargin}{\bibhang}}
	\def\newblock{\hskip .11em plus .33em minus .07em}
	\sloppy\clubpenalty4000\widowpenalty4000
	\sfcode`\.=1000\relax}

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
	\def\@citea{}\@cite{\@for\@citeb:=#2\do
		{\@citea\def\@citea{; }\@ifundefined
			{b@\@citeb}{{\bf ?}\@warning
				{Citation '\@citeb' on page \thepage \space undefined}}%
			{\csname b@\@citeb\endcsname}}}{#1}}

\let\@internalcite\cite
\def\cite{\def\citename##1{##1}\@internalcite}
\def\shortcite{\def\citename##1{}\@internalcite}

% Package hyperref should come late in class file to properly apply to any modified commands.
\RequirePackage{ifpdf}
\ifpdf
\usepackage[pdftex,breaklinks,hyperfootnotes=false,bookmarks=false]{hyperref}
\else
\usepackage[hyperfootnotes=false,bookmarks=false]{hyperref}
\fi
\hypersetup{
	colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,breaklinks=true
}

% remove newlines ('\\') from \title when assigning \pdftitle
\pdfstringdefDisableCommands{%
	% \let~\textasciitilde
	% \def\url{\pdfstringdefWarn\url}%
	% \let\textcolor\@gobble
	\let\\\@gobble
}

\AtBeginDocument{%
	\hypersetup{
		pdfcreator={LaTeX acmsiggraph.cls},
		pdfkeywords={\@ACMkeywords},
		pdftitle={\@title},
		pdfauthor={\@ACMpdfauthor},
	}%
}

%% #1 Caption
\renewenvironment{tikzfigure}[1][]{
	\def \rememberparameter{#1}
	\vspace{10pt}
	\refstepcounter{figurecounter}
	%\begin{flushleft}
}{
\ifx\rememberparameter\@empty
\else %nothing
\\[12pt]
{\textbf{Figure~\thefigurecounter}: \emph{\rememberparameter}}
\fi
%\end{flushleft}
}

%% Line Style

\tikzstyle{loosely dotted}=[dash pattern=on .2mm off 5mm,line cap=round, line width=2mm]
\tikzstyle{loosely dashed}=[line width=.5mm]

%% Disable Watermark
\tikzposterlatexaffectionproofoff

%% Title Stuff
\renewcommand\title[1]{\gdef\@title{\fontsize{\cgspostertitlesize}{\cgspostertitlefontsize}\selectfont\sffamily\bfseries #1}}
\renewcommand\author[1]{\gdef\@author{\huge\sffamily #1}}
\renewcommand\institute[1]{\gdef\@institute{\LARGE\sffamily #1}}

%% THEME STUFF
\usetheme{Simple} % Simple as basis

\definecolorstyle{CGSThemeColor}{
	% Define default colors
	% GrayBlueYellow
	\definecolor{colorred}{HTML}{98223A} 
	\definecolor{colorlightgrey}{HTML}{5A6065} 
	\definecolor{colorgrey}{HTML}{5A6065} 
	\definecolor{colorblue}{HTML}{007A9E} 
	\definecolor{colororange}{HTML}{C76E30}
	\definecolor{coloryellow}{HTML}{F6A800}
}{
% Background Colors
\colorlet{backgroundcolor}{white}
\colorlet{framecolor}{white}
% Title Colors
\colorlet{titlefgcolor}{white}
\colorlet{titlebgcolor}{colorred}
% Block Colors
\colorlet{blocktitlebgcolor}{colorgrey}
\colorlet{blocktitlefgcolor}{colorred}
\colorlet{blockbodybgcolor}{white}
\colorlet{blockbodyfgcolor}{black}
% Innerblock Colors
\colorlet{innerblocktitlebgcolor}{colorred}
\colorlet{innerblocktitlefgcolor}{black}
\colorlet{innerblockbodybgcolor}{white}
\colorlet{innerblockbodyfgcolor}{black}
% Note colors
\colorlet{notefgcolor}{black}
\colorlet{notebgcolor}{colorgrey!70!white}
\colorlet{notefrcolor}{colorgrey}
}

\definetitlestyle{CGSThemeTitle}{
	width=\paperwidth, roundedcorners=0, linewidth=0pt, innersep=1.5cm,
	titletotopverticalspace=0mm, titletoblockverticalspace=15mm,
	titlegraphictotitledistance=-5mm
}{
\draw[draw=none, fill=titlebgcolor]%
(\titleposleft,\titleposbottom) rectangle (\titleposright,\titlepostop); %
\node[anchor=north west,inner sep=0] at (\titleposleft,\titleposbottom-2.5mm) {\includegraphics[width=\linewidth]{./resources/header.pdf}}; %
}

\defineinnerblockstyle{CGSInnerBlock}{
	titlewidthscale=1, bodywidthscale=1, titleleft,
	titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0pt, bodyoffsety=0pt,
	bodyverticalshift=0pt, roundedcorners=0, linewidth=0.2cm,
	titleinnersep=0.6cm, bodyinnersep=0.8cm
}{
\begin{scope}[line width=\innerblocklinewidth, rounded corners=\innerblockroundedcorners]
	\ifInnerblockHasTitle %
	\draw[draw=none, fill=innerblockbodybgcolor]
	(innerblockbody.south west) rectangle (innerblocktitle.north east);
	\draw[color=innerblocktitlefgcolor, loosely dotted]
	(innerblocktitle.south west) -- (innerblocktitle.south east);%
	\else
	\draw[draw=none, fill=innerblockbodybgcolor]
	(innerblockbody.south west) rectangle (innerblockbody.north east);
	\fi
\end{scope}
}

\usetitlestyle{CGSThemeTitle}
\usecolorstyle{CGSThemeColor}
\useinnerblockstyle{CGSInnerBlock}

\newcommand{\blocktitle}[2]{
	\ifstrempty{#1}{
		\huge\sffamily\bfseries #2
	}{
	\huge\sffamily\bfseries #1 \quad #2
}
}

\newcommand{\subblocktitle}[2]{
	\ifstrempty{#1}{
		\LARGE\sffamily\bfseries #2
	}{
	\LARGE\sffamily\bfseries #1 \quad #2
}
}

\newcommand{\printfooter}{
	\block{}{
		\hspace{-2.6cm}\includegraphics[width=1.0\textwidth,height=0.92cm]{./resources/footer.pdf}
		\vspace{-1.9cm}%
	}%
}%

%% lines from multicol package

\setlength\columnsep{3cm}
\setlength{\columnseprule}{0.5mm}
\renewcommand\columnseprulecolor{\color{colorlightgrey}}

%% end of file
\endinput
