\version "2.24.2"

\include "./common/metadata.ily"

\include "./common/score-includes.ily"

% MIDI
\bookpart {
  \bookOutputName "[Composer] - [Piece]"
  #(ly:set-option 'midi-extension "mid")
  \score {
    \unfoldRepeats
    <<
      \new StaffGroup = "strings" <<
        \globalSettings
        \new Staff = "violinI" <<
          \set Staff.midiInstrument = #"violin"

          \globalFirstMov
          \violinIFirstMov
        >>
        \new Staff = "violinII" <<
          \set Staff.midiInstrument = #"violin"

          \globalFirstMov
          \violinIIFirstMov
        >>
        \new Staff = "viola" <<
          \set Staff.midiInstrument = #"viola"

          \globalFirstMov
          \violaFirstMov
        >>
        \new Staff = "cello" <<
          \set Staff.midiInstrument = #"cello"

          \globalFirstMov
          \celloFirstMov
        >>
      >>
    >>
    \include "./parts/i-midi.ily"
  }    
  \score {
    <<
      \new StaffGroup = "strings" <<
        \globalSettings
        \new Staff = "violinI" <<
          \set Staff.midiInstrument = #"violin"

          \globalSecondMov
          \violinISecondMov
        >>
        \new Staff = "violinII" <<
          \set Staff.midiInstrument = #"violin"

          \globalSecondMov
          \violinIISecondMov
        >>
        \new Staff = "viola" <<
          \set Staff.midiInstrument = #"viola"

          \globalSecondMov
          \violaSecondMov
        >>
        \new Staff = "cello" <<
          \set Staff.midiInstrument = #"cello"

          \globalSecondMov
          \celloSecondMov
        >>
      >>
    >>
    \include "./parts/ii-midi.ily"
  }
}