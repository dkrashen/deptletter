\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deptletter}
\LoadClass[letterpaper]{letter} % based on letter class

\RequirePackage{graphicx} % to include logo graphic
\RequirePackage{fancyhdr} % headings and footer
\RequirePackage{pxfonts} % I like this font

\RequirePackage{etoolbox} % for boolean expressions

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
\DeclareFixedFont{\@xcmrbn}{OT1}{cmr}{b}{n}{10}
\DeclareFixedFont{\@xcmrmn}{OT1}{cmr}{m}{n}{10}
\DeclareFixedFont{\@xcmrmnl}{OT1}{cmr}{m}{n}{8}
\DeclareFixedFont{\@ixcmrmn}{OT1}{cmr}{m}{n}{10}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% configurable commands, values set in tex file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtoggle{signatureexists}
\togglefalse{signatureexists}
\newcommand{\@signatureimagefilename}{}
\newcommand{\DLsignaturepic}[1]{
  \toggletrue{signatureexists}
  \renewcommand{\@signatureimagefilename}{#1}
}

\newcommand{\DLfoot}[1]{
  \fancyfoot[c]{\@xcmrmnl #1}
}

\newcommand{\@showletterdate}{\today}
\newcommand{\DLdate}[1]{\renewcommand{\@showletterdate}{\@xcmrmn #1}}
   
\newcommand{\@showname}{}
\newcommand{\DLsignature}[1]{\renewcommand{\@showname}{#1}}

\newcommand{\@showwebsite}{}
\newcommand{\DLwebsite}[1]{\renewcommand{\@showwebsite}{{\\ #1}}}

\newcommand{\@showcontact}{}
\newcommand{\DLcontact}[1]{\renewcommand{\@showcontact}
  {
  \vspace*{-1.625cm}
  \\
  \@xcmrmn #1
  {\@ixcmrmn {\@showwebsite}}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE CONTENT ELEMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\date{\@showletterdate} % use the user configured date

\pagestyle{fancy} % make sure we actually use fancyhdr

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header with logo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\DLheaderpic}[1]{
  \fancypagestyle{firstpage}
    {\fancyhead[C]
      {\includegraphics[height=1in, keepaspectratio=true] {#1}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% opening and closing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\DLopening}[1]{
  \begin{letter}{\@showcontact}
  
  \opening{#1}
}

\newcommand{\DLclosing}[1]{
  \closing{#1 \\
  \iftoggle{signatureexists}
  {
    \fromsig{\includegraphics[height=.7in]{\@signatureimagefilename}}\\
  } {}
    \fromname{\@showname}}
  \end{letter}
}

