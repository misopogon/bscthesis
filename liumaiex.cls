%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Template for bachelor and master theses at the
%    Department of Mathematics at Linköping University.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% This template was made by Jonas Granholm
%    (jongr157@student.liu.se)
%
% It is a nearly complete rewrite of the previous
% template which was compiled by Per Erik Strandberg



% If you don't know what you're doing, don't edit this file.
% Create a file with the .tex extension containing the
% outline below, and start from there.
%
%     \documentclass[<language>,<level>]{liumaiex}
%     
%     <preamble>
%     
%     \begin{document}
%     
%     \frontmatter
%     
%     <information about thesis>
%     
%     \maketitle
%     
%     <introduction>
%     
%     \mainmatter
%     
%     <main text>
%     
%     \end{document}
%
% <language> should be replaced by either english or swedish.
% <level> should be replaced by either bachelor or master,
%   or not used at all.
% <preamble> is the place to load any packages you want to use
%   and perhaps define useful macros.
% <information about thesis> should look something like this:
%
%     \title{<the title of your thesis>}
%     \author{<your full name(s)>}
%     \shortauthor{<your last name(s)>}
%     \supervisor{<your supervisors name>}{<his/her department>}
%     \examiner{<your examiners name>}{<his/her department>}
%     \regnumber{<the ISRN given by administrators later>}
%     \publishmonth{<the month the thesis is published>}
%     \publishyear{<the year the thesis is published>}
%     \keywords{<the keywords of your thesis, comma separated>}
%     \publishurl{<url to the published thesis (you'll get it later)>}
%
%   The commands \supervisor and \examiner can be used multiple times.
%   There are a few additional commands that may be used:
%
%     \department{<department, if not MAI>}
%     \city{<the city where the thesis is published, if not Linköping>}
%     \level{<usually G2 or A, if level is not specified earlier>}
%     \credits{<usually 16 hp or 30 hp, if level is not specified earlier>}
%     \pdftitle{<the title of the thesis>}
%     \pdfauthor{<the author(s) of the thesis>}
%     \pdfkeywords{<the keywords of the thesis>}
%     \pdfsubject{<the subject of the thesis>}
%
%   The information in the last four commands will end up in the
%   pdf metadata. If these commands are not used, then the title,
%   author and keywords info from the previous commands will be
%   used instead, but the \pdf... variants can be used if there
%   are problems with messy formatting etc.
% <introduction> should contain things like your abstract and
%   acknowledgement, and it should end with \tableofcontents
%   and perhaps \listoffigures and \listoftables.
% <main text> is the rest of the thesis.
%
% To compile your thesis you need this file and the file liulogo.pdf
% in the same directory as your .tex file.









%-------------------------------------------------------------------------------
%	Notes
%-------------------------------------------------------------------------------


% Difference in output from old template:
%		URL and keyword placement after abstract
%		language specific labels on titlepages and after abstract
%		correct (language specific) hyphenation and dashes
%			on copyright page
%		added pdf metadata
%		added hyperref package
%		removed the epress logo and moved liu logo and text
%			on copyright page
%		adjusted titlepages

%% Double percent signs indicate comment to fix

%% kolla in http://www.liu.se/insidan/kommunikationsstod/grafiskprofil (/start/1.341973/Grafisk_profil_20120503.pdf)
%% för info om t.ex. loggans placering
%%		loggan verkar ha ändrats, nya finns som liulogo.pdf

%% Fixa rätt pappersformat (S5)?
%%		För article 10 pt är texthöjden 10+45*12 = 550 pt
%%		och textbredden 345 pt

%% gör mer kompatibelt med dvi?
%%		kräver att liulogo.pdf görs om till eps
%%			pdftops -eps liulogo.pdf
%%		metadata?
%%			låt hyperref fixa metadatan?
%%		välja driver?

%% ändra alla språkval så att polyglossia tas med i instruktioner.pdf
%% ändra så att TeX-motorer står rätt i instruktionerna
%% se till att rätt inladdade paket står med (beroende av motor)
%%		behöver alla stå med?
%%			kanske vissa klarar att laddas igen?

%% When done:
%%		Uppdatera datumet i \ProvidesClass
%%		Kolla att instruktionerna i Instruktioner.pdf
%%			samt längst upp i detta dokument är aktuella



%-------------------------------------------------------------------------------
%	Identification
%-------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{liumaiex}[2014/01/08 Exjobbsmall för Matematiska institutionen vid Linköpings universitet]


%-------------------------------------------------------------------------------
%	Options
%-------------------------------------------------------------------------------

% --- Language ---
\newif\if@langswe
% English is default since \newif sets new bools to false
\DeclareOption{swedish}{\@langswetrue}
\DeclareOption{english}
	{\if@langswe
		\ClassWarningNoLine{liumaiex}
			{Both 'swedish' and 'english' options used}
	\fi
	\@langswefalse}

% --- Level ---
\DeclareOption{bachelor}
	{\newcommand{\@level}{G2}
	\newcommand{\@credits}{16 hp}}
\DeclareOption{master}
	{\ifx\@level\undefined
		\newcommand{\@level}{A}
		\newcommand{\@credits}{30 hp}
	\else
		\ClassWarningNoLine{liumaiex}{Both 'bachelor' and 'master' options used}
	\fi}


% --- Executing options ---
\ProcessOptions\relax


%-------------------------------------------------------------------------------
%	Packages
%-------------------------------------------------------------------------------

\LoadClass[a4paper]{book}

\usepackage{iftex}
\newif\if@xeorlua
\ifXeTeX\@xeorluatrue\fi
\ifLuaTeX\@xeorluatrue\fi
\if@xeorlua
	\RequirePackage{polyglossia}
	\RequirePackage{fontspec}
\else
	\RequirePackage[T1]{fontenc}
	\RequirePackage[swedish,english]{babel}
	\RequirePackage[utf8]{inputenc}
\fi
\RequirePackage{graphics}
\RequirePackage{tabularx}
%%\RequirePackage{epstopdf} %% Necessary for eps logo when not dvi>ps
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage[pass]{geometry}

%-------------------------------------------------------------------------------
%	Info
%-------------------------------------------------------------------------------

\newcommand{\liu}{}
\newcommand{\mai}{}

\newcommand{\@shortauthor}{}
\newcommand{\@publishmonth}{}
\newcommand{\@publishyear}{}
\newcommand{\@city}{Linköping}
\newcommand{\@department}{\mai}
\newcommand{\@supervisortext}{}
\newcommand{\@examinertext}{}
\providecommand{\@level}{} % If not set in options
\providecommand{\@credits}{} % If not set in options
\newcommand{\@regnumber}{}
\newcommand{\@keywords}{}
\newcommand{\@publishurl}{}

\renewcommand{\@pdfauthor}{\@author} % previously set by hyperref
\renewcommand{\@pdftitle}{\@title} % previously set by hyperref
\renewcommand{\@pdfkeywords}{\@keywords} % previously set by hyperref

\newcommand{\@thesislabel}{}
\newcommand{\@levellabel}{}
\newcommand{\@supervisorlabel}{}
\newcommand{\@multisupervisorlabel}{}
\newcommand{\@examinerlabel}{}
\newcommand{\@multiexaminerlabel}{}
\newcommand{\@keywordslabel}{}
\newcommand{\@urllabel}{}


%-------------------------------------------------------------------------------
%	Language
%-------------------------------------------------------------------------------

% @langswe set in options
% Swedish and English loaded by Babel/Polyglossia in
%	preliminary packages
\if@langswe
	\renewcommand{\liu}{Linköpings universitet}
	\renewcommand{\mai}{Matematiska institutionen, \liu}
	\renewcommand{\@thesislabel}{Examensarbete}
	\renewcommand{\@levellabel}{Nivå}
	\renewcommand{\@supervisorlabel}{Handledare}
	\renewcommand{\@multisupervisorlabel}{Handledare}
	\renewcommand{\@examinerlabel}{Examinator}
	\renewcommand{\@multiexaminerlabel}{Examinatorer}
	\renewcommand{\@keywordslabel}{Nyckelord}
	\renewcommand{\@urllabel}{URL för elektronisk version}
	\if@xeorlua
		\setmainlanguage{swedish}
		\setotherlanguage{english}
	\else
		\AtBeginDocument{\selectlanguage{swedish}}
	\fi
\else
	\renewcommand{\liu}{Linköping University}
	\renewcommand{\mai}{Department of Mathematics, \liu}
	\renewcommand{\@thesislabel}{Thesis}
	\renewcommand{\@levellabel}{Level}
	\renewcommand{\@supervisorlabel}{Supervisor}
	\renewcommand{\@multisupervisorlabel}{Supervisors}
	\renewcommand{\@examinerlabel}{Examiner}
	\renewcommand{\@multiexaminerlabel}{Examiners}
	\renewcommand{\@keywordslabel}{Keywords}
	\renewcommand{\@urllabel}{URL for electronic version}
	\if@xeorlua
		\setmainlanguage{english}
		\setotherlanguage{swedish}
	\else
		\AtBeginDocument{\selectlanguage{english}}
	\fi
\fi


%-------------------------------------------------------------------------------
%	Info commands
%-------------------------------------------------------------------------------

%\author and \title are already defined by the article class
\newcommand*{\shortauthor}[1]{\renewcommand{\@shortauthor}{#1}}
\newcommand*{\publishmonth}[1]{\renewcommand{\@publishmonth}{#1}}
\newcommand*{\publishyear}[1]{\renewcommand{\@publishyear}{#1}}
\newcommand*{\city}[1]{\renewcommand{\@city}{#1}}
\newcommand*{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand*{\level}[1]{\renewcommand{\@level}{#1}}
\newcommand*{\credits}[1]{\renewcommand{\@credits}{#1}}
\newcommand*{\regnumber}[1]{\renewcommand{\@regnumber}{#1}}
\newcommand*{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand*{\publishurl}[1]{\renewcommand{\@publishurl}{#1}}
\newcommand*{\pdfauthor}[1]{\renewcommand{\@pdfauthor}{#1}}
\newcommand*{\pdftitle}[1]{\renewcommand{\@pdftitle}{#1}}
\newcommand*{\pdfkeywords}[1]{\renewcommand{\@pdfkeywords}{#1}}
\newcommand*{\pdfsubject}[1]{\renewcommand{\@pdfsubject}{#1}}

\newcommand*{\supervisorexaminerformat}[2]{\textbf{#1},\\#2}

\newif\if@firstsupervisor\@firstsupervisortrue
\newcommand{\supervisor}{\@ifstar\supervisor@star\supervisor@nostar}
\newcommand*{\supervisor@nostar}[2]
	{\if@firstsupervisor
		\renewcommand{\@supervisortext}
			{\supervisorexaminerformat{#1}{#2}}
		\@firstsupervisorfalse
	\else
		\let\@oldsupervisortext\@supervisortext
		\protected@edef\@supervisortext
			{\@oldsupervisortext\unexpanded{\\\\[-0.5em]
			\supervisorexaminerformat{#1}{#2}}}
		\renewcommand{\@supervisorlabel}{\@multisupervisorlabel}
	\fi}
\newcommand*{\supervisor@star}[1]{\supervisor@nostar{#1}{\@department}}

\newif\if@firstexaminer\@firstexaminertrue
\newcommand{\examiner}{\@ifstar\examiner@star\examiner@nostar}
\newcommand*{\examiner@nostar}[2]
	{\if@firstexaminer
		\renewcommand{\@examinertext}
			{\supervisorexaminerformat{#1}{#2}}
		\@firstexaminerfalse
	\else
		\let\@oldexaminertext\@examinertext
		\protected@edef\@examinertext
			{\@oldexaminertext\unexpanded{\\\\[-0,5em]
			\supervisorexaminerformat{#1}{#2}}}
		\renewcommand{\@examinerlabel}{\@multiexaminerlabel}
	\fi}
\newcommand*{\examiner@star}[1]{\examiner@nostar{#1}{\mai}}


%-------------------------------------------------------------------------------
%	Header
%-------------------------------------------------------------------------------

\fancyhf{} 
\fancyhead[LO]{\nouppercase{\small\rightmark}}
\fancyhead[RE]{\nouppercase{\small\leftmark}}
\fancyhead[LE,RO]{\small\thepage}
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
	\fancyhf{}  
	\fancyfoot[RE,LO]{\nouppercase{\small\@shortauthor,\space\@publishyear.}}
	\fancyfoot[LE,RO]{\small\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0.2pt}}


%-------------------------------------------------------------------------------
%	Title
%-------------------------------------------------------------------------------

\renewcommand{\maketitle}{%
	\cleardoublepage
	\newgeometry{textwidth=12cm,hcentering}%
	\pagestyle{empty}%
	\setcounter{page}{-1}%
	\begin{center}
		\null
		\vskip 2cm%
		{\LARGE\@thesislabel\vskip 2cm}%
		{\LARGE\textbf{\@title}\vskip 1em}%
		{\LARGE\@author\vskip 1em}%
		{\large\@regnumber}
	\end{center}
	\restoregeometry
	\cleardoublepage
	\begin{center}
		\null
		\vskip 4cm%
		{\Large\textbf{\@title}\vskip 1em}%
		\@department\vskip 1em%
		\textbf{\@author}\vskip 1em%
		\@regnumber
	\end{center}
	\vfill
	\begin{tabularx}{\textwidth}{@{}r@{\quad}X@{}}
		\@thesislabel:&
			\textbf{\@credits}\\\\[-0.5em]
		\@levellabel:&
			\textbf{\@level}\\\\[-0.5em]
		\@supervisorlabel:&
			\begin{minipage}[t]{\linewidth}\raggedright
				\@supervisortext
			\end{minipage}\\\\[-0.5em]
		\@examinerlabel:&
			\begin{minipage}[t]{\linewidth}\raggedright
				\@examinertext
			\end{minipage}\\\\[-0.5em]
		\@city:&
			\textbf{\@publishmonth\space\@publishyear}
	\end{tabularx}
	\cleardoublepage
	\pagestyle{fancy}}

%-------------------------------------------------------------------------------
%	After abstract
%-------------------------------------------------------------------------------

\newcommand{\placekeywords}
	{\begin{description}\item[\@keywordslabel:]\ \\\@keywords\end{description}}
\newcommand{\placeurl}
	{\begin{description}\item[\@urllabel:]\ \\\@publishurl\end{description}}


%-------------------------------------------------------------------------------
%	PDF info
%-------------------------------------------------------------------------------

%% Currently handled by hyperref

%\AtEndDocument{%
%	\pdfinfo{
%		/Author (\@pdfauthor)
%		/Title (\@pdftitle)
%		/Keywords (\@pdfkeywords)
%		/Subject (\@pdfsubject)}}
%%		/Creator
%%		/Producer
%%		/CreationDate
%%		/ModDate


%-------------------------------------------------------------------------------
%	Copyright page
%-------------------------------------------------------------------------------

\AtEndDocument{%
\cleardoublepage
\thispagestyle{plain}

\null\hfill\resizebox{2.5cm}{!}{\includegraphics{liulogo}}\hspace{1pt}

\vskip 2em

\if@xeorlua
	\begin{english}
	\csname fontspec_if_fontspec_font:T\endcsname{%
		\addfontfeature{Ligatures=TeX}}
\else
	\begin{otherlanguage*}{english}
\fi
Copyright
\medskip

The publishers will keep this document online on the Internet -- or its possible replacement -- for a period of 25 years from the date of publication barring exceptional circumstances.
The online availability of the document implies a permanent permission for anyone to read, to download, to print out single copies for your own use and to use it unchanged for any non-commercial research and educational purpose. Subsequent transfers of copyright cannot revoke this permission. All other uses of the document are conditional on the consent of the copyright owner. The publisher has taken technical and administrative measures to assure authenticity, security and accessibility.
According to intellectual property law the author has the right to be mentioned when his/her work is accessed as described above and to be protected against infringement.
For additional information about the Linköping University Electronic Press and its procedures for publication and for assurance of document integrity, please refer to its WWW home page: http://www.ep.liu.se/
\if@xeorlua
	\end{english}
\else
	\end{otherlanguage*}
\fi
\bigskip

\if@xeorlua
	\begin{swedish}
	\csname fontspec_if_fontspec_font:T\endcsname{%
		\addfontfeature{Ligatures=TeX}}
\else
	\begin{otherlanguage*}{swedish}
\fi
Upphovsrätt
\medskip

Detta dokument hålls tillgängligt på Internet -- eller dess framtida ersättare -- under 25 år från publiceringsdatum under förutsättning att inga extraordi\-nära omständigheter uppstår.
Tillgång till dokumentet innebär tillstånd för var och en att läsa, ladda ner, skriva ut enstaka kopior för enskilt bruk och att använda det oförändrat för ickekommersiell forskning och för undervisning. Överföring av upphovsrätten vid en senare tidpunkt kan inte upphäva detta tillstånd. All annan användning av dokumentet kräver upphovsmannens medgivande. För att garantera äktheten, säkerheten och tillgängligheten finns det lösningar av teknisk och administrativ art.
Upphovsmannens ideella rätt innefattar rätt att bli nämnd som upphovsman i den omfattning som god sed kräver vid användning av dokumentet på ovan beskrivna sätt samt skydd mot att dokumentet ändras eller presenteras i sådan form eller i sådant sammanhang som är kränkande för upphovsmannens litterära eller konstnärliga anseende eller egenart.
För ytterligare information om Linköping University Electronic Press se förlagets hemsida http://www.ep.liu.se/
\if@xeorlua
	\end{swedish}
\else
	\end{otherlanguage*}
\fi

\medskip

\copyright\phantom{.} \@publishyear, \@author}

\endinput
