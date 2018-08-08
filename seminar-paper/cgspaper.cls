\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgspaper}[03/23/2011 CGS Paper class by J.E. Kyprianidis; 10/14/2013 English variant by J. Truemper]

\newif\ifcgs@english

\DeclareOption{english}{%
    \cgs@englishtrue}

\DeclareOption{german}{%
	\cgs@englishfalse}

% Assume we're producing a german version unless the user explicitly specifies 'english' as package option
\ExecuteOptions{german}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{acmsiggraph}}
\ProcessOptions
\LoadClass{acmsiggraph}

\RequirePackage[scaled=.92]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{parskip}
\RequirePackage[labelfont=bf,textfont=it]{caption}
\RequirePackage{translations}
\RequirePackage{tikz}

\usetikzlibrary{calc}

\DeclareTranslationFallback {cgs@Faculty}{\uppercase{Faculty of Digital Engineering}}
\DeclareTranslation{ngerman}{cgs@Faculty}{\uppercase{Digital Engineering Fakult{\"a}t}}
\DeclareTranslation{english}{cgs@Faculty}{\uppercase{Faculty of Digital Engineering}}

\DeclareTranslationFallback {cgs@group}{Computer Graphics Systems Group}
\DeclareTranslation{ngerman}{cgs@group}{Fachgebiet Computergrafische Systeme}
\DeclareTranslation{english}{cgs@group}{Computer Graphics Systems Group}

\gdef\@unilogosize{1.0}
\gdef\@hpilogosize{1.0}
% \gdef\@hpilogosize{0.42}

\gdef\@logosuffix{black}
\gdef\@logo{
	\newlength{\cgs@logoheight}
	\setlength{\cgs@logoheight}{3.5em}
	\begin{tikzpicture}[]
	\node[anchor=west, inner sep=0pt, outer sep=0pt] at (0.0, 0.0) (unilogo) { \includegraphics[height=\@unilogosize\cgs@logoheight]{graphics/uni_logo_\@logosuffix} };
	\node[anchor=west, inner sep=0pt, outer sep=0pt] at ($(unilogo.east)+(0.175,0.0)$) (hpilogo) { \includegraphics[height=\@hpilogosize\cgs@logoheight]{graphics/hpi_logo_\@logosuffix} };
	\node[anchor=south west, yshift=1pt, inner sep=0pt, outer sep=0pt] at ($(hpilogo.east)+(0.175,0.0)$) { \large\GetTranslation{cgs@Faculty} };
	\node[anchor=north west, yshift=-1pt, inner sep=0pt, outer sep=0pt] at ($(hpilogo.east)+(0.175,0.0)$) { \large\GetTranslation{cgs@group} };
	\end{tikzpicture}
}


\gdef\@subject{}
\def\subject#1{\gdef\@subject{#1}}

\renewcommand{\copyrightspace}{%
    \let\oldthefootnote=\thefootnote% save original footnote definition
    \renewcommand{\thefootnote}{}%
    \footnotetext[0]{
    \parbox{200pt}{\vspace{10pt}\tiny\sffamily
	\@logo\\
    \ifx\@subject\@empty\else
        {\@subject}\\[1ex]
    \fi
    http://www.hpi3d.de
    }}
    \let\thefootnote=\oldthefootnote% restore original footnote definition
}
