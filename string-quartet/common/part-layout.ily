\version "2.24.2"

% Part Layout Settings
\paper {
  % page-breaking = #ly:page-turn-breaking
  % #(set-paper-size "a4")
  ragged-last-bottom = ##t
}

% Set global layout options for individual parts
\layout {
  #(layout-set-staff-size 18)
  \compressEmptyMeasures
  \context {
    \Score
    \override DynamicTextSpanner.style = #'none
    \override TupletBracket.bracket-visibility = ##f
    % \override BarNumber.font-size = #1
    % \override BarNumber.padding = #3
  }
}