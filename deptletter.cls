\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deptletter}

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lipsum}
\RequirePackage[letterpaper]{geometry}
\RequirePackage{pxfonts}

\LoadClass[letterpaper]{letter}

\setlength{\headheight}{76pt}

\setlength{\textwidth}{5.125in}
\setlength{\textheight}{7.0in}
\setlength{\footskip}{1.0in}
\setlength{\oddsidemargin}{0.625in}
\setlength{\evensidemargin}{0.625in}
\setlength{\topmargin}{-.5in}

\DeclareFixedFont{\xcmrbn}{OT1}{cmr}{b}{n}{10}
\DeclareFixedFont{\xcmrmn}{OT1}{cmr}{m}{n}{10}
\DeclareFixedFont{\xcmrmnl}{OT1}{cmr}{m}{n}{8}
\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{10}

\fancypagestyle{firstpage}
  {\fancyhead[C]
    {\includegraphics[height=1in, keepaspectratio=true]{logo.pdf}}}

\newcommand{\showmyfoot}{}
\newcommand{\myfoot}[1]{\renewcommand{\showmyfoot}{\xcmrmnl #1}}

\fancyfoot[c]{\showmyfoot}
\newcommand{\letterstart}{\begin{letter}{\showcontact}}
\newcommand{\letterend}{\end{letter}}


\newcommand{\showletterdate}{\today}
\newcommand{\letterdate}[1]{\renewcommand{\showletterdate}{\xcmrmn #1}}
\renewcommand{\headrulewidth}{0pt}
\date{\showletterdate}
   
\pagestyle{fancy}
\makeatletter

\newcommand{\subjectname}{Subject}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{\subjectname: #1}}

\newcommand{\showwebsite}{}
\newcommand{\website}[1]{\renewcommand{\showwebsite}{{\\ #1}}}

\newcommand{\showcontact}{}
\newcommand{\contact}[1]{\renewcommand{\showcontact}
  {
  \vspace*{-1.625cm}
  \\
  \xcmrmn #1
  {\ixcmrmn {\showwebsite}}}}

\makeatother 
