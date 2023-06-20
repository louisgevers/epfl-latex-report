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

% Graphics
\RequirePackage{graphicx}
\RequirePackage{subcaption}

% Better environments
\RequirePackage{environ}

% Control sequences
\RequirePackage{ifthen}

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
    \begin{minipage}[c]{0.49\textwidth}%
        \ifthenelse{\equal{#2}{L}}{\raggedright}{\ifthenelse{\equal{#2}{R}}{\raggedleft}{\centering}}%
        \large%
        {\textit{#1}}\par%
        }{%
    \end{minipage}%
}

%%%%%%%%%%%%%%%%
%%% Commands %%%
%%%%%%%%%%%%%%%%

% Author formats
\newcommand*{\name}[2]{#1\space\textsc{#2}} % Name - Surname
\newcommand*{\student}[3]{\name{#1}{#2}: #3} % Name - Surname - Sciper