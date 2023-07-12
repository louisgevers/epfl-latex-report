%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EPFL REPORT TEMPLATE     %
% Author: Louis Gevers     %
% Date:   07/2023          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{epflreport}

% Define the a4 option as a default option
\DeclareOption*{\PassOptionsToClass{a4paper}{article}}

% Load the article class
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%%%%%%%
%%% Packages %%%
%%%%%%%%%%%%%%%%

% Page layout
\RequirePackage[margin=2.5cm]{geometry}

% Change font size to 12pt with more spacing
\renewcommand{\normalsize}{\fontsize{12}{16}\selectfont}

% Change header font size
\RequirePackage{sectsty}
\sectionfont{\fontsize{20}{16}\selectfont}

% Graphics
\RequirePackage{graphicx}
\RequirePackage{subcaption}

% Better environments
\RequirePackage{environ}

% Control sequences
\RequirePackage{ifthen}

% Lorem ipsums
\RequirePackage{lipsum}

% Bibliography
\RequirePackage[
    backend=biber,
    style=ieee,
    hyperref=true,
]{biblatex}
\addbibresource{bibliography.bib}

% Hyperlinks
\RequirePackage{hyperref}

% Images and figures
\RequirePackage{graphicx}

% Colors
\RequirePackage[table]{xcolor}

% Nicer tables
\RequirePackage{booktabs}

% More space between table rows
\renewcommand{\arraystretch}{1.2}

% Custom bullets
\RequirePackage{pifont}

%%%%%%%%%%%%%%%%%%%%
%%% Environments %%%
%%%%%%%%%%%%%%%%%%%%

% Report cover environment
\NewEnviron{cover}[5]{%
    \begin{titlepage}
        \begin{center}%
            \includegraphics[height=1.5cm]{cover/logo.png}\par%
            \vspace{0.5cm}
            {\Large\textsc{#1}}\par% Institution
            \vspace{1cm}%
            \hrule%
            \vspace{1cm}%
            {\Large\textsc{#2}}\par% Subtitle
            \vspace{0.5cm}%
            {\LARGE\textsc{#3}}\par% Title
            \vspace{1cm}%
            \hrule%
            \vspace{1cm}%
            \includegraphics[width=0.9\textwidth]{cover/teaser.png}\par%
            \vspace{2cm}%
            \BODY%
            \vfill%
            {\large{#4}}\par% Date
            \vspace{0.2cm}
            {\large{#5}}\par% Laboratory
        \end{center}
    \end{titlepage}
}

% Authors of the report
\newenvironment{reportauthors}[2]{% Author type - L/R/C
    \begin{minipage}[c]{0.45\textwidth}%
        \ifthenelse{\equal{#2}{L}}{\raggedright}{\ifthenelse{\equal{#2}{R}}{\raggedleft}{\centering}}%
        \large%
        {\textit{#1}}\par%
        }{%
    \end{minipage}%
}

% Abstract
\renewenvironment{abstract}{%
    \section*{Abstract}
    \addcontentsline{toc}{section}{Abstract}
}{}

%%%%%%%%%%%%%%%%
%%% Commands %%%
%%%%%%%%%%%%%%%%

% Author formats
\newcommand*{\name}[2]{#1\space\textsc{#2}} % Name - Surname
\newcommand*{\student}[3]{\name{#1}{#2}: #3} % Name - Surname - Sciper

% Table of contents
\def\maketoc{%
    \cleardoublepage
    \tableofcontents
}

% Bibliography
\def\makebibliography{%
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{section}{References}
    \printbibliography
}

% References commands
\newcommand{\figureref}[1]{Figure~\ref{fig:#1}}
\newcommand{\sectionref}[1]{Section~\ref{section:#1}}
\newcommand{\tableref}[1]{Table~\ref{tab:#1}}