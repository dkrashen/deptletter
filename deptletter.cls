\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deptletter}
\LoadClass[letterpaper]{letter} % based on letter class

\RequirePackage{graphicx} % to include logo graphic
\RequirePackage{fancyhdr} % headings and footer
\RequirePackage{pxfonts} % I like this font

\RequirePackage[letterpaper]{geometry} % adjustments of margins

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adjust margins etcetera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\headheight}{76pt}

\setlength{\textwidth}{5.125in}
\setlength{\textheight}{7.0in}
\setlength{\footskip}{1.0in}
\setlength{\oddsidemargin}{0.625in}
\setlength{\evensidemargin}{0.625in}
\setlength{\topmargin}{-.5in}

\renewcommand{\headrulewidth}{0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% some fonts to use for footer, addresses, etcetera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareFixedFont{\xcmrbn}{OT1}{cmr}{b}{n}{10}
\DeclareFixedFont{\xcmrmn}{OT1}{cmr}{m}{n}{10}
\DeclareFixedFont{\xcmrmnl}{OT1}{cmr}{m}{n}{8}
\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{10}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header with logo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{firstpage}
  {\fancyhead[C]
    {\includegraphics[height=1in, keepaspectratio=true]{logo.pdf}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy} % make sure we actually use fancyhdr

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% configurable commands, values set in tex file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\showmyfoot}{}
\newcommand{\myfoot}[1]{\renewcommand{\showmyfoot}{\xcmrmnl #1}}

\fancyfoot[c]{\showmyfoot}
\newcommand{\letterstart}{\begin{letter}{\showcontact}}
\newcommand{\letterend}{\end{letter}}

\newcommand{\showletterdate}{\today}
\newcommand{\letterdate}[1]{\renewcommand{\showletterdate}{\xcmrmn #1}}
   

\newcommand{\showwebsite}{}
\newcommand{\website}[1]{\renewcommand{\showwebsite}{{\\ #1}}}

\newcommand{\showcontact}{}
\newcommand{\contact}[1]{\renewcommand{\showcontact}
  {
  \vspace*{-1.625cm}
  \\
  \xcmrmn #1
  {\ixcmrmn {\showwebsite}}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\date{\showletterdate} % use the user configured date

