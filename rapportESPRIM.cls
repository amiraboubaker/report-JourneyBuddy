% rapportESPRIM.cls
% ==========================================================
% Patch for old LaTeX kernels (if \IfPackageLoadedT is missing)
\makeatletter
\@ifundefined{IfPackageLoadedT}{
  \newcommand{\IfPackageLoadedT}[2]{%
    \@ifpackageloaded{#1}{#2}{}%
  }
}{}
\makeatother

% --------------------- Document Class ---------------------
\LoadClass[a4paper,12pt]{report}

% --------------------- Language and Encoding ---------------------
\usepackage[english]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage{multirow}
\usepackage{afterpage}
\usepackage{graphicx}
\usepackage{multirow}

% --------------------- Typography and Style ---------------------
\usepackage{times}
\usepackage{setspace}
\setstretch{1.5}
\usepackage{geometry}
\geometry{
    a4paper,
    top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm
}
\usepackage{ragged2e}
\justifying
\setlength{\parindent}{0.5cm}
\setlength{\parskip}{0pt}
\clubpenalty=100
\widowpenalty=100
\displaywidowpenalty=100
\tolerance=2000
\emergencystretch=10pt

% --------------------- Titles and Sections ---------------------
\usepackage{titlesec}

\renewcommand\thesection{\thechapter.\arabic{section}.}
\renewcommand\thesubsection{\thesection\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}

\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titleformat{\section}
  {\normalfont\Large\bfseries}{\thesection}{0.2cm}{}
\titleformat{\subsection}
  {\normalfont\large\bfseries}{\thesubsection}{0.2cm}{}
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsection}{0.2cm}{}
\titlespacing*{\section}{0.2cm}{0.3cm}{0.2cm}
\titlespacing*{\subsection}{0.4cm}{0.3cm}{0.2cm}
\titlespacing*{\subsubsection}{0.6cm}{0.3cm}{0.2cm}

% --------------------- Table of Contents ---------------------
\usepackage{tocloft}
\renewcommand{\cftchapfont}{\bfseries}
\renewcommand{\cftsecfont}{\bfseries}

% --------------------- Figures and Captions ---------------------
\usepackage{graphicx}
\usepackage{float}
\usepackage[justification=centering, font=small, labelfont=bf]{caption}
\usepackage{subcaption}
\captionsetup[table]{name=Tab.}
\captionsetup[figure]{name=fig.}

% --------------------- Math and Scientific Formatting ---------------------
\usepackage{mathtools}
\usepackage{siunitx}

% --------------------- Utilities ---------------------
\usepackage{url}
\usepackage[hidelinks]{hyperref}
\usepackage[section]{placeins}
\usepackage{fancyhdr}
\usepackage{wallpaper}
\usepackage{nomencl}
\usepackage{xcolor}
\usepackage{tcolorbox}
\usepackage{tocbibind}
\usepackage{tabularx}

% --------------------- Header and Footer ---------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\nouppercase{\leftmark}}
\fancyfoot[L]{\textbf{ESPRIM \titre}}
\fancyfoot[R]{\thepage}
\setlength{\headheight}{16pt}
\setlength{\footskip}{1.5cm}

% --------------------- Custom Section Levels ---------------------
\titleclass{\subsubsubsection}{straight}[\subsubsection]
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\titleformat{\subsubsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsubsection}{0.2cm}{}
\titlespacing*{\subsubsubsection}{0.6cm}{0.3cm}{0.2cm}

% --------------------- Custom Environments ---------------------
\newtcolorbox{definitionbox}{
  colback=gray!10,
  colframe=black,
  boxrule=0.5pt,
  arc=2mm,
  left=1mm,
  right=1mm,
  top=1mm,
  bottom=1mm
}

% --------------------- Custom Commands ---------------------
\newcommand{\UE}[1]{\renewcommand{\UE}{#1}}
\newcommand{\sujet}[1]{\renewcommand{\sujet}{#1}}
\newcommand{\titre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\enseignant}[1]{\renewcommand{\enseignant}{#1}}
\newcommand{\eleves}[1]{\renewcommand{\eleves}{#1}}

\newcommand{\fairepagedegarde}{
    \thispagestyle{empty}
    \ThisLRCornerWallPaper{1}{figures/PageDeGarde.png}
    \clearpage
    % --- Force a blank page after page de garde ---
    \thispagestyle{empty}
    \null
    \clearpage
}

\newcommand{\tabledematieres}{
\tableofcontents
\clearpage
}

\newcommand{\insererfigure}[4]{
\begin{figure}[ht]
\centering
\includegraphics[height=#2]{#1}
\caption{#3}
\label{fig:#4}
\end{figure}
}

\newcommand{\fairepagefinale}{
\begin{titlepage}
    \ThisLRCornerWallPaper{1}{logos/PageFinale.png}
\end{titlepage}
}

% --------------------- Custom Chapter Style ---------------------
\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}

\def\@makechapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \centering \reset@font
        \thickhrulefill\quad
        \scshape \@chapapp{} \thechapter
        \quad \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1\par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
    \vskip 100\p@}}

\def\@makeschapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \centering \reset@font
        \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1\par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
    \vskip 100\p@}}
\makeatother

\newcommand{\chaptertitleinline}[1]{%
  \vspace*{10pt}
  {\centering
    \scshape \@chapapp{} \thechapter
    \par
    \vspace*{10pt}
    \Huge \bfseries #1\par
    \vspace*{10pt}
    \hrule
    \vspace*{20pt}
  }
}
