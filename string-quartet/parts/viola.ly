\version "2.24.2"

\include "../common/metadata.ily"
\include "../common/part-layout.ily" % Part layout specifications that affects all parts

\include "./i-global.ily" % Global settings for first movement
\include "./i-viola.ily" % Viola notes for first movement

\include "./ii-global.ily" % Global settings for second movement
\include "./ii-viola.ily" % Viola notes for second movement

% \include "./iii-global.ily" % Global settings for third movement
% \include "./iii-viola.ily" % Viola notes for third movement

% \include "./iv-global.ily" % Global settings for fourth movement
% \include "./iv-viola.ily" % Viola notes for fourth movement

\include "./viola_defs.ily" % Custom elements for viola part

\bookpart {
  \paper {
    % first-page-number = 2 % Set to even or odd number to start as an open spread or single page
    % page-breaking = #ly:page-turn-breaking % Change type of page breaking
    % page-count = 4 % If you know how many pages you want the part to be, set here.
  }
  \bookOutputName "[Composer] - [Piece] - Viola Part"
  \header {
    pdftitle = "[Composer] - [Piece] - Viola Part"
    instrument = \violaName
  }
  
  \score {
    \header {
      piece = \headerI
    }
    \new Staff \with { \consists Page_turn_engraver } <<
      \set Staff.instrumentName = \violaName
      
      \globalSettings % From "../common/metadata.ily"

      \globalFirstMov % From "./i-global.ily"
      \violaFirstMov % From "./i-viola.ily"
      % \new Voice = "breaks" { \violaBreakI } % From "./viola_defs.ily"
      % \new Voice = "overrides" { \violaOverridesI } % From "./viola_defs.ily"
    >>
    \layout { }
  }
  
  \score {
    \header {
      piece = \headerII
    }
    \new Staff \with { \consists Page_turn_engraver } <<
      % Set minimum value for space before page turn
      % \set Staff.minimumPageTurnLength = #(ly:make-moment 4/4) 

      \globalSettings % From "../common/metadata.ily"
      
      \globalSecondMov % From "./ii-global.ily"
      \violaSecondMov % From "./ii-viola.ily"
      % \new Voice = "breaks" { \violaBreakII } % From "./viola_defs.ily"
      % \new Voice = "overrides" { \violaOverridesII } % From "./viola_defs.ily"
    >>
    \layout { }
  }
}