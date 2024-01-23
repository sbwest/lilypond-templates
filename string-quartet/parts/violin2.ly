\version "2.24.2"

\include "../common/metadata.ily"
\include "../common/part-layout.ily" % Part layout specifications that affects all parts

\include "./i-global.ily" % Global settings for first movement
\include "./i-violin2.ily" % Violin II notes for first movement

\include "./ii-global.ily" % Global settings for second movement
\include "./ii-violin2.ily" % Violin II notes for second movement

% \include "./iii-global.ily" % Global settings for third movement
% \include "./iii-violin2.ily" % Violin II notes for third movement

% \include "./iv-global.ily" % Global settings for fourth movement
% \include "./iv-violin2.ily" % Violin II notes for fourth movement

\include "./violin2_defs.ily" % Custom elements for Violin II part

\bookpart {
  \paper {
    % first-page-number = 1 % Set to even or odd number to start as an open spread or single page
    % page-breaking = #ly:page-turn-breaking % Change type of page breaking
    % page-count = 4 % If you know how many pages you want the part to be, set here.
  }
  \bookOutputName "[Composer] - [Piece] - Violin 2 Part"
  \header {
    pdftitle = "[Composer] - [Piece] - Violin 2 Part"
    instrument = \violinIIName
  }
  
  \score {
    \header {
      piece = \headerI
    }
    \new Staff \with { \consists Page_turn_engraver } <<
      \set Staff.instrumentName = \violinIIName

      \globalSettings % From "../common/metadata.ily"

      \globalFirstMov % From "./i-global.ily"
      \violinIIFirstMov % From "./i-violin2.ily"
      % \new Voice = "breaks" { \violinIIBreakI } % From "./violin2_defs.ily"
      % \new Voice = "overrides" { \violinIIOverridesI } % From "./violin2_defs.ily"
    >>
    \layout { }
  }
  
  \score {
    \new Staff \with { \consists Page_turn_engraver } <<
      \set Staff.minimumPageTurnLength = #(ly:make-moment 3/8)

      \globalSettings % From "../common/metadata.ily"

      \globalSecondMov % From "./ii-global.ily"
      \violinIISecondMov % From "./ii-violin2.ily"
      % \new Voice = "breaks" { \violinIIBreakII } % From "./violin2_defs.ily"
      % \new Voice = "overrides" { \violinIIOverridesII } % From "./violin2_defs.ily"
    >>
    \header {
      piece = \headerII
    }
    \layout { }
  }
}