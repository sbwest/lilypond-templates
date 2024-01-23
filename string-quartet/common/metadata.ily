\version "2.24.2"

% Use preferred custom font of Gonville, with TeX Gyre Pagella as Roman font, Gill Sans as Sans font
\include "/Users/bryanwest/Lilypond/include/gonville-default.ily"

\paper {
  #(set-paper-size "c4") % C4 paper is closest to standard music paper (12 x 9 in.)
  % Specify page breaking engine
  page-breaking = #ly:optimal-breaking
  % page-breaking = #ly:page-turn-breaking 
  % page-breaking = #ly:minimal-breaking
  % first-page-number = 2
  % system-system-spacing = #'((basic-distance . 0.1) (padding . 0))
  % ragged-last-bottom = ##f
  % ragged-bottom = ##f
}

globalSettings = { 
  %% These two lines are to show bar numbers every n bars, and to not show numbers at the end of a line
  %% Default shows bar numbers at the beginning of every line
  % \override Score.BarNumber.break-visibility = #end-of-line-invisible
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)
  %%
  %% Place bar numbers inside box 
  \override Score.BarNumber.stencil = #(make-stencil-boxer 0.1 0.25 ly:text-interface::print)
  % Set bar number font
  \override Score.BarNumber.font-name = "Tex Gyre Pagella"
  % \accidentalStyle modern
  %% If sub beaming is desired, specify base value here
  % \set baseMoment = #(ly:make-moment 1/8)
}

\header {
  title = \markup { \abs-fontsize #20 "" } 
  subtitle = \markup {\abs-fontsize #16 "" }
  % opus = ""
  composer = \markup { \abs-fontsize #12 "" }
  date = ""
  source = ""
  style = ""
  mutopiatitle = ""
  mutopiacomposer = ""
  mutopiaopus = ""
  mutopiainstrument = ""
  license = "Creative Commons 4.0"
  maintainer = "Bryan West"
  maintainerEmail = "bryan.west@protonmail.com"
  moreInfo = ""
  tagline = ##f
}

%% Global layout settings
\layout {
  \context {
    \Score
    \override DynamicTextSpanner.style = #'none % Hide extender lines from text dynamics like 'cresc'
    % \override TupletBracket.bracket-visibility = ##f % Hide tuplet brackets
  }
}

%%%%%
% Custom font markup functions
\markup pagella = \markup \override #'((font-name . "TeX Gyre Pagella") (font-size . 1)) \etc
\markup pagellaBold = \markup \override #'((font-name . "Tex Gyre Pagella Bold") (font-size . 1)) \etc
\markup customTempo = \markup \override #'((font-name . "Tex Gyre Pagella Bold") (font-size . 1)) \etc

%%%%%
% Instrument names
violinIName = \markup \pagella "Violin I"
violinIIName = \markup \pagella "Violin II"
violaName = \markup \pagella "Viola"
celloName = \markup \pagella "Cello"

%%%%%
% Movement Titles
% header[N] variables for each movement title or number of work. To be placed in the 'piece' element of a \header block
% Example:
headerI = "I."
headerII = "II."
% headerIII = "III."
% headerIV = "IV."

%%%%%
% Custom dynamics & expressions 
% These are two examples of a dynamic script and a text script

%% Dynamic Script
% fz = #(make-dynamic-script "fz")

%% Text Script (italics)
% dolce = \markup { \italic "dolce" }
% staccato = \markup { \italic staccato }
% legato = \markup { \italic legato }

%%%%%
% Commonly used custom expressions, articulations, functions, etc.

% Fermata that goes over final barline
finalFermata = \mark \markup { \musicglyph #"scripts.ufermata" } 

% Function to repeat chords <g e c>4 4 will repeat this chord as quarter notes 4 times
repeatChord = #(define-music-function (parser location chord repeats) (ly:music? integer?)
  #{
    \repeat unfold $repeats $chord
  #})

%% Control tuplet number and bracket visibility
tupletNum = \revert TupletNumber.stencil
noTupletNum = \override TupletNumber.stencil = ##f
tupletBracket = \override TupletBracket.bracket-visibility = ##t
noTupletBracket = \override TupletBracket.bracket-visibility = ##f