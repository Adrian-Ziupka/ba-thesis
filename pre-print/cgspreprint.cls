\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgspreprint}

\ProcessOptions\relax

\LoadClass[fontsize=10pt]{scrarticle}

\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage[T1]{fontenc}
\usepackage{lmodern}

\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{scrhack}
\RequirePackage{scrpage2}

\RequirePackage[ngerman,english]{babel}
\RequirePackage[hyphens]{url}
\RequirePackage[colorlinks=true,citecolor=blue,linkcolor=black,urlcolor=blue,bookmarks=false]{hyperref}

\RequirePackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{filecontents}

\RequirePackage{listings}

\RequirePackage{csquotes}

\RequirePackage{natbib}
\RequirePackage{bibentry}
\bibliographystyle{abbrvnat}
\usepackage{doi}

\RequirePackage{showframe}

\date{}

\newlength{\cgslogoheight}
\setlength{\cgslogoheight}{3.5em}

%\KOMAoption{fontsize}{9pt}

\renewcommand*{\titlepagestyle}{empty}

\setkomafont{title}{\normalfont\bfseries}
\setkomafont{subtitle}{\normalfont\bfseries}
\makeatletter
\patchcmd{\@maketitle}{\@title}{\Large \@title}{}{}
\patchcmd{\@maketitle}{\usekomafont{subtitle}\@subtitle}{\usekomafont{subtitle}\large \@subtitle}{}{}
\patchcmd{\@maketitle}{\@publishers}{\normalsize \@publishers}{}{}
\makeatother

\titlehead{
	\begin{tikzpicture}[inner sep=0pt, outer sep=0pt]
	\node[anchor=east] at (\textwidth,0.0) (hpilogo) { \includegraphics[height=0.42\cgslogoheight]{graphics/hpi_logo_cmyk} };
	\node[anchor=east] at ($(hpilogo.west)-(0.25,0.0)$) (unilogo) { \includegraphics[height=1.0\cgslogoheight]{graphics/uni_logo_cmyk} };
	\draw[line width=0.5pt] (0.0,0.0) -- ($(unilogo.west)-(0.25,0.0)$);
	\node[anchor=south west, yshift=4pt] at (0.0, 0.0) { \usekomafont{publishers}\large \uppercase{Digital Engineering Faculty}};
	\node[anchor=north west, yshift=-4pt] at (0.0, 0.0) { \usekomafont{publishers}\large \uppercase{Computer Graphics Systems Group}};
	\end{tikzpicture}
}

\newcommand{\authors}[1]{%
\publishers{\vspace{-2.5\baselineskip}#1}
}


\lstset{
	backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
	basicstyle=\tiny\ttfamily,        % the size of the fonts that are used for the code
	breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
	breaklines=true,                 % sets automatic line breaking
	extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
	frame=single,	                   % adds a frame around the code
	keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
	rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
	showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
	showstringspaces=false,          % underline spaces within strings only
	showtabs=true,                  % show tabs within strings adding particular underscores
	tabsize=2,	                   % sets default tabsize to 2 spaces
    breaklines=true,
    columns=fullflexible,
%    language=[LaTeX]TeX,
}

\subtitle{Authors Version}

\newcommand{\printbibentry}[1]{
\blockquote{\footnotesize\bibentry{#1}}
}
