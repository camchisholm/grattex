\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grattan}[2015/02/27 Reports of the Grattan Institute, Melbourne]

\LoadClass[a4paper,11pt,titlepage,headings=big,chapterprefix=false,headsepline,
parskip=half-,twocolumn,landscape,numbers=noenddot]{scrreprt}
\RequirePackage{cmap}
\RequirePackage{scrhack}
\RequirePackage{acronym}
\RequirePackage{makeidx}
  \makeindex
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb}
\RequirePackage{tikz,adjustbox}
  \usetikzlibrary{positioning}
  \usetikzlibrary{decorations.text}
  \usetikzlibrary{decorations.pathmorphing}
  \usetikzlibrary{patterns,arrows,decorations.pathreplacing} % for waterfalls
\RequirePackage{float}
\RequirePackage{placeins}
\RequirePackage{afterpage}
% needs to be switched off for copying and pasting
\RequirePackage[activate={true,nocompatibility},final,expansion,tracking=true,kerning=true, spacing=false,selected=true,letterspace=-4]{microtype}
% Arial font looks a little bit spaced. One way to do it is to adjust the letterspace 
% option to microtype.  Another is to adjust the spaceskip
% \spaceskip=1.5\fontdimen2\font plus 1.5\fontdimen3\font
% minus 1.5\fontdimen4\font
% ------
% Grattan colors
%\definecolor{Orange}{HTML}{F68B33}
\definecolor{OrangeBackground}{RGB}{254,240,222}  % for boxes
\definecolor{Color1}{RGB}{255,224,127}
\definecolor{Color2}{RGB}{255,195,90}
\definecolor{Color3}{RGB}{246,139,51}
\definecolor{Color4}{RGB}{212,88,42}
\definecolor{Color5}{RGB}{160,34,38}
\definecolor{Color6}{RGB}{98,18,20}
\definecolor{theGrey}{HTML}{6A737B}
\definecolor{AuthorPage}{RGB}{160,34,38}
\definecolor{AuthorGrey}{RGB}{174,174,174}
% See http://tex.stackexchange.com/questions/8510/reduce-size-of-bullet-character-in-lists
% Purpose to enlarge and subsequently raise the bullet
% see also \renewcommand{\labelitemi}{\raise .5ex\hbox{\tiny$\bullet$}}
\renewcommand{\labelitemi}{\color{Orange}\parbox[c]{.5em}{\ensuremath{\bullet}}}
\renewcommand{\labelenumi}{\color{Orange}{\bfseries \arabic{enumi}.~}}
% ------
\RequirePackage{colortbl}
\RequirePackage{array}
\RequirePackage{tablefootnote} % for footnotes within tables
\newcommand{\myhline}{\noalign{\global\arrayrulewidth1pt}\hline
                      \noalign{\global\arrayrulewidth1pt}}


\RequirePackage{graphicx}

% No widows
\RequirePackage[all]{nowidow}

% Arial font
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{uarial}
  \renewcommand{\familydefault}{\sfdefault}

\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{newfloat}
\RequirePackage{caption}
% Cross references.
\RequirePackage{varioref}
% \RequirePackage{navigator}
% \newcommand\Chapter[1]{%
%   \chapter[\protect\jumplink{ch\thechapter}{#1}]{#1}%
%   \outline[fit=fitv]{1}[ch\thechapter]{#1}%
% }
\RequirePackage[colorlinks,colorlinks = true, urlcolor=blue, linkcolor=black,citecolor=blue]{hyperref}
\RequirePackage{cleveref}
\RequirePackage{bookmark}

% Make url formatting the same
\urlstyle{same}

\DeclareCaptionFont{Orange}{\color{Orange}}
\DeclareCaptionJustification{nohyphen}{\hyphenpenalty=10000}
\captionsetup{justification=nohyphen, singlelinecheck=false}

% Boxes
\crefname{smallboxfloat}{Box}{Boxes}
\Crefname{smallboxfloat}{Box}{Boxes}
\DeclareFloatingEnvironment[fileext=frm,name=Box]{smallboxfloat}
\mdfdefinestyle{GrattanFrameBox}{%
    linecolor=Orange,
    nobreak=true, % prevents page breaking
    outerlinewidth=0.5pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=\baselineskip,
    innerrightmargin=11pt,
    innerleftmargin=11pt,
    backgroundcolor=OrangeBackground
    }
    
\mdfdefinestyle{GrattanFrameBoxUltra}{%
    linecolor=Orange,
    nobreak=true, % prevents page breaking
    outerlinewidth=0.5pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=\baselineskip,
    innerrightmargin=11pt,
    innerleftmargin=11pt,
    backgroundcolor=OrangeBackground
    }
    
% The smallbox is a box intended for onecolumn.
\newenvironment{smallbox}[2]{%
\setlength{\currentparskip}{\parskip}% save the value
\begin{smallboxfloat}
\vfill
\begin{mdframed}[style=GrattanFrameBox]%
 \setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange},font={bf,Orange},format=plain,justification=justified,singlelinecheck=false}
 \caption{#1}\label{#2}
 \vspace{-1.5ex}
}{\end{mdframed}\vfill\end{smallboxfloat}}  



% Big boxes -- over the whole page
% It is recommended to surround this with an \afterpage{% 
\newenvironment{bigbox}[2]{\onecolumn\setlength{\currentparskip}{\parskip}
\begin{smallboxfloat}
\begin{mdframed}[style=GrattanFrameBox]%
\setlength{\columnsep}{10mm}
\begin{multicols}{2}
\setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange}, font={bf,Orange}, format=plain,justification=justified,singlelinecheck=false}
 \caption{#1}\label{#2}%
 } {\end{multicols}\end{mdframed}\end{smallboxfloat}\twocolumn}

\newenvironment{ultrabox}[2]{\onecolumn\setlength{\currentparskip}{\parskip}
\begin{smallboxfloat}
\pagecolor{OrangeBackground}
\begin{mdframed}[style=GrattanFrameBoxUltra]%
\setlength{\columnsep}{10mm}
\begin{minipage}[t][\textheight][t]{\textwidth} % textheight
\begin{multicols}{2}
\setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange}, font={bf,Orange}, format=plain,justification=justified,singlelinecheck=false}
 \caption{#1}\label{#2}%
 } {\end{multicols}\end{minipage}\end{mdframed}\end{smallboxfloat}%
 \clearpage\twocolumn\nopagecolor}
 
 
% Captions in general
\DeclareCaptionFont{theGrey}{\color{theGrey}}
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}}
% suppress hyphenation in caption
\DeclareCaptionJustification{nohyphen}{\hyphenpenalty=10000}
\captionsetup{justification=nohyphen}

\newcommand{\captionwithunits}[2]{%
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, justification=raggedright,
singlelinecheck=false}
\caption{#1}
\vspace{-11pt}
\captionsetup{font={small,color=theGrey}}
\caption*{#2}
}

\newcommand{\captionoffigurewithunits}[2]{%
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, justification=raggedright,
singlelinecheck=false}
\captionof{figure}{#1}
\vspace{-11pt}
\captionsetup{font={small,color=theGrey}}
\caption*{#2}
}

% New user friendly (less typing) \Caption?
\newcommand{\Caption}[3]{\captionwithunits{#1}{#2}\label{#3}}

\newcommand{\source}[1]{\footnotesize\textit{Source:~#1}}
\newcommand{\notes}[1]{\footnotesize\textit{Notes:~#1}}

\setkomafont{disposition}{\bfseries\color{Orange}}
\addtokomafont{chapter}{\Large}
\addtokomafont{section}{\normalsize}

% Spacing
\RedeclareSectionCommand[
  beforeskip=-1sp,
  afterskip=2\baselineskip]{chapter}
\RedeclareSectionCommand[
  beforeskip=-\baselineskip,
  afterskip=.5\baselineskip]{section}
\RedeclareSectionCommand[
  beforeskip=-.75\baselineskip,
  afterskip=.5\baselineskip]{subsection}
\RedeclareSectionCommand[
  beforeskip=-.5\baselineskip,
  afterskip=.25\baselineskip]{subsubsection}
\RedeclareSectionCommand[
  beforeskip=.5\baselineskip,
  afterskip=-1em]{paragraph}
\RedeclareSectionCommand[
  beforeskip=-.5\baselineskip,
  afterskip=-1em]{subparagraph}

% Spacing
\RedeclareSectionCommand[
  beforeskip=1.5\baselineskip,
  afterskip=2\baselineskip]{chapter}
\RedeclareSectionCommand[
  beforeskip=4pt,
  afterskip=1sp]{section}
\RedeclareSectionCommand[
  beforeskip=-.75\baselineskip,
  afterskip=.5\baselineskip]{subsection}
\RedeclareSectionCommand[
  beforeskip=-.5\baselineskip,
  afterskip=.25\baselineskip]{subsubsection}
\RedeclareSectionCommand[
  beforeskip=.5\baselineskip,
  afterskip=-1em]{paragraph}
\RedeclareSectionCommand[
  beforeskip=-.5\baselineskip,
  afterskip=-1em]{subparagraph}

  
\renewcommand*{\@seccntformat}[1]{\csname the#1\endcsname\hspace{1.25em}}

  
% --------------
%
% Grattan twocolumn
%
%---------------

% N.B. geometry must be after hyperref, and hence cleveref


\RequirePackage[landscape,twocolumn,
% orig Word specify 2.3 and 2.5
left=2.75cm,right=2.75cm
]{geometry}
  %\addtolength{\columnwidth}{50pt}
  \setlength{\columnsep}{10mm}  
  %\addtolength{\columnwidth}{0.2\columnwidth}

% Ensures hyperlinked chapter headings refer to their referent headings
% not the preceding baseline
\RequirePackage{etoolbox}
% Add extra hyper target for chapter: chapter..\thechapter
\renewcommand*{\chapterformat}{%
  \mbox{\raisebox{25pt}[0pt][0pt]{\hypertarget{chapter..\thechapter}{}}% Add 
    \chapappifchapterprefix{\nobreakspace}\thechapter\hspace{1em}\autodot\enskip}%
}

% Update \addcontentsline to jump to new hyper target _only_ if \chapter is used
\patchcmd{\addcontentsline}% <cmd>
  {\Hy@writebookmark}% <search>
  {\ifnum\pdfstrcmp{chapter}{#2}=0 % Chapter mark
     \edef\@currentHref{chapter..\thechapter}%
   \fi
   \Hy@writebookmark}% <replace>
  {}{}% <success><failure>

  
 % Requests forcefully that figures refrain from
% appearing in the first column.  This will fail
% should a \clearpage be experienced.
  \g@addto@macro\@floatplacement{%
  \if@firstcolumn
  \global\@colnum\z@
  \fi
  }
  
%% ---------------------------------
%  Headers and footers
%% ---------------------------------
\RequirePackage[headsepline,plainheadsepline,footsepline,plainfootsepline]{scrlayer-scrpage}

\clearscrheadings
\clearscrplain
\clearscrheadfoot
% -------

% Avoid spaces or newlines in the following commands' arguments: they 
% may cause errors.
% Furthermore, optional arguments are required: they appear in Chapter 
% heading pages. Leaving them out will reset the titles on pages with 
% \chapter{}
\lehead[\normalfont\textcolor{theGrey}{\mytitle}]{\normalfont\textcolor{theGrey}{\mytitle}}
\lohead[\normalfont\textcolor{theGrey}{\mytitle}]{\normalfont\textcolor{theGrey}{\mytitle}}
\ifoot[{\textcolor{theGrey}{\normalfont Grattan Institute 2015\phantom{\Large X}}}]{\textcolor{theGrey}{\normalfont Grattan Institute 2015\phantom{\Large X}}}
\ofoot[\normalfont\textcolor{theGrey}{\thepage}]{\normalfont\textcolor{theGrey}{\thepage}}

\setkomafont{headsepline}{\color{Orange}}
\setkomafont{footsepline}{\color{Orange}}
\setheadsepline{1pt}
\setfootsepline{1pt}
%\setheadtopline{0pt}  
\pagestyle{scrheadings}

%% Title pages
\RequirePackage{eso-pic}
\newcommand\BackgroundPic{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,%
keepaspectratio]{./FrontPage/FrontPagePicture.pdf}%
\vfill
}}}


\RequirePackage{epstopdf}
\newcommand{\logoskip}{\par\vspace{16pt}}
\newcommand{\includegraphicsmaybe}[1]{\IfFileExists{#1}{\includegraphics{#1}}{\includegraphics{dummy.pdf}}}
\newcommand{\noimage}{%
  \setlength{\fboxsep}{-\fboxrule}%
  \fbox{\phantom{\rule{150pt}{100pt}}}% Framed box
}
\patchcmd{\Gin@ii}
  {\begingroup}% <search>
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}% <replace>
  {}% <success>
  {}% <failure>

\AtBeginDocument{%
% TitlePage
\AddToShipoutPicture*{\BackgroundPic}
  \maketitle
  \let\mytitle\@title
\ClearShipoutPicture
\lsstyle
%
% Following page.
  \subsection*{Grattan Institute Support}
  %\begin{minipage}[t][0.7\textheight][t]{\columnwidth}
  \begin{minipage}{\columnwidth}
  \begin{multicols}{2}
  \textbf{\textcolor{theGrey}{Founding members}}\logoskip
  \begin{center}
  \includegraphics[width=4cm]{./logos/aus-gov-logo-stacked-black.eps}\logoskip
  \includegraphics[width=3.5cm]{./logos/Vic_Gov_Logo.eps}\logoskip
  \includegraphics[width=3.5cm]{./logos/UOM-Pos_S_PMS.eps}\logoskip\vfil
  \includegraphics[width=3.5cm]{./logos/Bhp.pdf}
  \end{center}
  \columnbreak
  
  \textbf{\textcolor{theGrey}{Program support}}
  
  {\footnotesize Higher Education}
  \begin{center}
  \includegraphics[width=2.5cm]{./logos/TMF_logo_green.eps}
  \end{center}
  \textbf{\textcolor{theGrey}{Affiliate Partners}}\\[3pt]
  {\footnotesize%
  Google \\[3pt]
  Origin Foundation
  }\\[8pt]
  \textbf{\textcolor{theGrey}{Senior Affiliates}}\\[3pt]
  {\footnotesize
  EY\\[3pt]
  PwC\\[3pt]
  Stockland\\[3pt]
  The Scanlon Foundation\\[3pt]
  Wesfarmers
  }\\[8pt]
  \textbf{\textcolor{theGrey}{Affiliates}}\\[3pt]
  {\footnotesize
  Ashurst\\[3pt]
  Corrs\\[3pt]
  Deloitte\\[3pt]
  Jacobs\\[3pt]
  Mercy Health\\[3pt]
  Sinclair Knight Merz\\[3pt]
  Urbis\\[3pt]
  Westpac
  }
  \end{multicols}
  \end{minipage} 
  \input{Acknowledgements}
}

% Table of contentss
\setcounter{tocdepth}{0}

\RequirePackage{multicol}
\newlength{\currentparskip}

% Designing the overview
% ---
% We define a new environment that take as its contents the text of the 
% overview, placing it with a chapter* heading 'Overview' all on the same
% page. 
\newenvironment{overview}%
  {\onecolumn\vtop to 0pt\bgroup\vspace{-25pt}\chapter*{Overview}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}


% Bibliography
\RequirePackage[british]{babel}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=authoryear-ibid,ibidtracker=true, autocite=footnote]{biblatex}
\renewcommand*{\bibfont}{\raggedright}
\DeclareLanguageMapping{british}{british-apa}


%% Bibliography formatting
% separating entries
\setlength\bibitemsep{1.5\itemsep}
% format bibliography
\renewcommand*{\bibfont}{\small}

%% Citation tweaking
\DeclareFieldFormat{titlecase}{#1}
\setlength\bibhang{.5in}
\renewcommand*{\bibnamedash}{%
  \ifdimless{\leftmargin}{0.75em}
    {\mbox{\textemdash\space}}
    {\makebox[\leftmargin][l]{%
       \ifdimless{\leftmargin}{1.25em}
         {\textendash}
         {\rule{0.8\bibhang}{.2pt}}}}}
% Hyperlinks entire citation label for most citaiton commands 
% http://tex.stackexchange.com/questions/15951/hyperlink-name-with-biblatex-authoryear-biblatex-1-4b
\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}

\DeclareFieldFormat{textcitehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{%
    #1%
    \ifbool{cbx:parens}
      {\bibcloseparen\global\boolfalse{cbx:parens}}
      {}}}

\savebibmacro{cite}
\savebibmacro{textcite}

\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}

\renewbibmacro*{textcite}{%
  \ifboolexpr{
    ( not test {\iffieldundef{prenote}} and
      test {\ifnumequal{\value{citecount}}{1}} )
    or
    ( not test {\iffieldundef{postnote}} and
      test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )
  }
    {\DeclareFieldAlias{textcitehyperref}{noformat}}
    {}%
  \printtext[textcitehyperref]{%
    \restorebibmacro{textcite}%
    \usebibmacro{textcite}}}

% The following lines give the correct footcite Author (Year) but make the ibid erroneous
% Author (ibid) % use ifciteibid
\DeclareCiteCommand{\footcite}[\mkbibfootnote]
  {\boolfalse{cbx:parens}}
  {\usebibmacro{citeindex}%
  \ifciteibid{Ibid.}{%  % for ibidem
   \iffirstcitekey
     {\setcounter{textcitetotal}{1}}
     {\stepcounter{textcitetotal}%
      \textcitedelim}%
   \usebibmacro{textcite}}%
   }
  {\ifbool{cbx:parens}
     {\bibcloseparen\global\boolfalse{cbx:parens}}
     {}}
  {\usebibmacro{textcite:postnote}}
\newcommand{\gcite}[1]{{\citeauthor{#1} (\citedate{#1})}}

\RequirePackage{tocloft}
\renewcommand{\cftchapfont}{\normalsize}
\renewcommand{\cftchapdotsep}{.}
\AtBeginDocument{\renewcommand{\contentsname}{Table of contents}}
\newcommand{\contentspage}{%
\onecolumn
\begin{multicols}{2}
\phantom{.}
\vfill
\columnbreak
\tableofcontents
\end{multicols}
\twocolumn%
}



