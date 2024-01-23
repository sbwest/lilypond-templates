\version "2.24.2"

\include "../common/metadata.ily"
\include "../common/part-layout.ily" % Part layout specifications that affects all parts

\include "./i-global.ily" % Global settings for first movement
\include "./i-violoncello.ily" % Cello notes for first movement

\include "./ii-global.ily" % Global settings for second movement
\include "./ii-violoncello.ily" % Cello notes for second movement

% \include "./iii-global.ily" % Global settings for third movement
% \include "./iii-violoncello.ily" % Cello notes for third movement

% \include "./iv-global.ily" % Global settings for fourth movement
% \include "./iv-violoncello.ily" % Cello notes for fourth movement

\include "./violoncello_defs.ily" % Custom elements for cello part

\bookpart {
  \paper {
    % first-page-number = 2 % Set to even or odd number to start as an open spread or single page
    % page-breaking = #ly:page-turn-breaking % Change type of page breaking
    % page-count = 4 % If you know how many pages you want the part to be, set here.
  }
  \bookOutputName "[Composer] - [Piece] - Cello Part"
  \header {
    pdftitle = "[Composer] - [Piece] - Cello Part"
    instrument = \celloName
  }
  
  \score {
    \header {
      piece = \headerI
    }
    \new Staff \with { \consists Page_turn_engraver } <<
      \set Staff.instrumentName = \celloName
      \globalSettings % From "../common/metadata.ily"

      \globalFirstMov % From "./i-global.ily"
      \celloFirstMov % From "./i-violoncello.ily"
      % \new Voice = "breaks" { \celloBreakI }
      % \new Voice = "overrides" { \celloOverridesI }
    >>
    \layout {}
  }
  
  \score {
    \header {
      piece = \headerII
    }
    \new Staff \with { \consists Page_turn_engraver } <<    
      \globalSettings  % From "../common/metadata.ily"

      \globalSecondMov  % From "./ii-global.ily"
      \celloSecondMov  % From "./ii-violoncello.ily"
      % \new Voice = "breaks" { \celloBreakII }
      % \new Voice = "overrides" { \celloOverridesII }
    >>
    \layout {}
  }
}