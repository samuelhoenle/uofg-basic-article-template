% =============================================================================
% uofg-basic-article.cls
%
% Template for basic articles for the University of Glasgow.
% Based on the l4proj template (https://www.overleaf.com/latex/templates/university-of-glasgow-level-4-computing-science-project-template/spqpnkvzjdbw)
% and https://github.com/impleri/glasgow-thesis.
%
% =============================================================================

\ProvidesClass{uofg-basic-article}[%
2021/10/29 Samuel Hönle <2709806H@student.gla.ac.uk> Initial version
]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions
\LoadClass[11pt,a4paper]{article}

\usepackage[british]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8x]{inputenc}

\usepackage[libertine,bigdelims,vvarbb]{newtxmath} % bb from STIX
\usepackage[cal=boondoxo]{mathalfa} % mathcal

\usepackage{amsmath,amsbsy}
\usepackage[style]{abstract} % abstract styling

% make all cross-references clickable, enable line breaks for URLs
\usepackage{url}
\def\UrlBreaks{\do\/\do-}
\usepackage{breakurl}
\usepackage[hidelinks,breaklinks]{hyperref}

% set bibliography styling
\usepackage{doi}
\newcommand*{\urlprefix}{Available from: }
\newcommand*{\urldateprefix}{Accessed }
\usepackage[sectionbib]{natbib} % remove option sectionbib if using report style
\bibpunct{(}{)}{;}{a}{}{;}

\usepackage{etoolbox}
\usepackage[raggedright,compact]{titlesec} % section heading formatting
\usepackage{color} % colors
\usepackage[table,svgnames]{xcolor}
\usepackage[parfill]{parskip} % adjustable line spacing
\usepackage{listings} % nice code listings

% remove dots from ToC
\usepackage[titles]{tocloft} 
\renewcommand{\cftdot}{}
% increase spacing in ToC to avoid ascenders and descenders colliding
\renewcommand\cftsecafterpnum{\vskip 3pt}
%\renewcommand\cftbeforechapskip{5pt} % uncomment if using report class
\renewcommand\cftsubsecafterpnum{\vskip 1.5pt}
%\renewcommand\cftchapafterpnum{\vskip 4pt} % uncomment if using report class
\usepackage[nottoc]{tocbibind}

% from: https://gist.github.com/FelipeCortez/10729134
% set up listings for prettier output
\definecolor{bluekeywords}{rgb}{0.13, 0.19, 0.7}
\definecolor{greencomments}{rgb}{0.1, 0.5, 0.2}
\definecolor{redstrings}{rgb}{0.8, 0.15, 0.1}
\definecolor{graynumbers}{rgb}{0.5, 0.5, 0.5}
\definecolor{subtlegray}{rgb}{0.98, 0.98, 0.98}
\usepackage{lstautogobble}
\usepackage{listings}
\lstset{
    autogobble,    
    columns=fullflexible,
    showspaces=false,
    showtabs=false,
    breaklines=true,
    showstringspaces=false,
    breakatwhitespace=true,
    escapeinside={(*@}{@*)},
    rulecolor=\color{lightgray},
    backgroundcolor=\color{subtlegray},
    commentstyle=\color{greencomments},
    keywordstyle=\color{bluekeywords},
    stringstyle=\color{redstrings},
    numberstyle=\color{graynumbers},
    basicstyle=\ttfamily\linespread{1.15}\footnotesize,
    frame=tb,
    framesep=12pt,
    framexleftmargin=12pt,
    tabsize=4,
    captionpos=b
}
%% ---

% nice number printing
\usepackage{numprint}

% allow PDF graphics
\usepackage{graphicx}

% allow section styling
\usepackage{sectsty}

% enable styled captions
\usepackage[format=plain,
labelfont={bf,it},
textfont=it,tableposition=above]{caption}

\newcommand{\secfont}{\normalfont\sffamily}

% style the abstract
\renewcommand{\abstractnamefont}{\Large\secfont}
\renewcommand{\abstitlestyle}[1]{{{\let\clearpage\relax \section*{#1}}}} % change \section to \chapter when using report class

\usepackage[toc]{appendix}

% allow subfloats
\usepackage{subcaption}


% fix the margins and linespacing
\usepackage[a4paper, lmargin=0.1666\paperwidth, rmargin=0.1666\paperwidth, tmargin=0.1111\paperheight, bmargin=0.1111\paperheight]{geometry}
\setlength{\parskip}{5pt plus 2pt}

\usepackage{verbatim}
\newcommand{\quickwordcount}[1]{%
  \immediate\write18{texcount -1 -sum -merge -q #1.tex > #1-words.sum }%
  \input{#1-words.sum}words%
}

% define the title page
\newcommand{\course}[1]{\renewcommand{\@course}[1]{#1}}
\newcommand{\filename}[1]{\renewcommand{\@filename}[1]{#1}}
\global\newcommand{\@course}{}
\global\newcommand{\@filename}{main}
\usepackage{svg}
\renewcommand\maketitle{
  \definecolor{UniBlue}{HTML}{00355F}

  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote \thanks

  % main block
  \begin{center}
    % the logo
    \includesvg[height=3em]{template_ressources/uni_logo.svg}
    \vspace{1em}

    % the title
    \color{UniBlue}
    \noindent
    {\Huge \@title \par}%
    \vskip 1em%

    % the author and date
    {\normalsize
    \textbf{\@author}\\
    \@date}
    \vskip 0.25em%

    % course and word count
    \@course{}\\
    \quickwordcount{\@filename{}}
  \end{center}

  \vskip 1em%

  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@consentname\@empty
  \global\let\@consentdate\@empty

  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\usepackage{booktabs}

\usepackage{titlesec}
% set up chapter headings
\usepackage{xstring}
\titleformat{\chapter}[display]
  % only show numbers if they aren't Chapter 0 (i.e. front matter)
  {\normalfont}{}{0pt}{
    \huge\bfseries\secfont
    \IfInteger{\thechapter}{\ifnum0=0\thechapter\relax\else\relax {\Huge \thechapter}\ \rule[-0.25em]{0.5pt}{1.5em}\ \fi}
    {\thechapter \ \rule[-0.25em]{0.5pt}{1.5em}\ }}
  %[\titlerule]
  \titlespacing*{\chapter}      
  {0pt}{0pt}{15pt}  

% let us define a definition for unnumbered chapters.
% so we don't get a numbered bibliography or table of contents
\titleformat{name=\chapter,numberless}
            [display]
            {\normalfont\huge\bfseries\secfont}
            {}
            {0pt}
            {}

% highlight boxes
\usepackage{tcolorbox}
\newenvironment{highlight}
{\begin{tcolorbox}[notitle,boxrule=0pt,colback=green!10,colframe=green!10]}
{
\end{tcolorbox}
}

\newenvironment{highlight_title}[1]
{\begin{tcolorbox}[title=#1,boxrule=2pt,colback=green!10,colframe=green!20,coltitle=black,fonttitle=\bfseries]}
{
\end{tcolorbox}
}

% adjust margins
\setlength{\parindent}{2em}

% use (a) in figures
\captionsetup{subrefformat=parens}

% Algorithm typesetting package
\usepackage[plain, noline, shortend, linesnumberedhidden]{algorithm2e}
\SetAlFnt{\sffamily \small}

% adjust spacing
\titlespacing*{\section}{0pt}{1.5\baselineskip}{8pt plus 3pt minus 3pt}
\titlespacing*{\subsection}{10pt}{\baselineskip}{8pt plus 4pt minus 1pt}
\titleformat{\subsubsection}[runin]{\bfseries }{}{}{}[]
\titlespacing*{\chapter}{0pt}{0pt}{40pt plus 10pt minus 5pt} 

% switch to roman numeral for frontmatter
\pagenumbering{roman}

% fix itemise so it looks reasonable
\renewcommand{\@listI}{%
      \leftmargin=25pt
      \rightmargin=0pt
      \labelsep=5pt
      \labelwidth=20pt
      \itemindent=0pt
      \listparindent=0pt
      \topsep=0pt plus 2pt minus 4pt
      \partopsep=0pt plus 1pt minus 1pt
      \parsep=1pt plus 1pt
      \itemsep=\parsep}

% allow highlighting of text for todo notes
\usepackage{soul}
\newcommand{\todo}[1]{\large \hl{TODO: #1}\PackageWarning{TODO:}{#1!}}

% make urls less bulky and ugly
\renewcommand{\UrlFont}{\ttfamily\small}

% units for nice formatting of numbers
\usepackage{siunitx}

% line spacing
\linespread{1.2}

% command to mark elided text in quotes
\newcommand*\elide{\textup{(\,\dots)}\xspace}

% No double spacing between sentences
\frenchspacing

% Try to remove widows
\usepackage[all]{nowidow}

% To include a PDF for an ethics checklist, for example
\usepackage{pdfpages}

% basic latex options
\clubpenalty=10000 % general widow/orphan handling
\widowpenalty=10000 % general widow/orphan handling
\setlength{\parskip}{1.0\baselineskip} % basic gap between paragraphs = 1 blank line

% necessary options
\usepackage{setspace} % use \onehalfspacing and \singlespacin
\onehalfspacing

% kludge to make long quotes not have huge vertical spacing within a paragraph
\renewenvironment{quote}{\vspace{-0.66\baselineskip}\list{}{\rightmargin\leftmargin}\singlespacing\item\relax}{\endlist\vspace{-1.0\baselineskip}}
