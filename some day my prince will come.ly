\version "2.18.0"

% 2017-10-21 05:38:14 Sat
% per https://www.youtube.com/watch?v=M_m4YdYUSkM
% plus http://lilypond.1069038.n5.nabble.com/Four-Bars-per-Line-System-again-td45952.html

#(define (line-break-every-nth-engraver bars-per-line) 
  (lambda (context) 
     (make-engraver 
       (acknowledgers ((paper-column-interface engraver grob source-engraver) 
         (let ((current-bar (ly:context-property context 'currentBarNumber))) 
           (if (= (remainder current-bar bars-per-line) 1) 
               (if (eq? #t (ly:grob-property grob 'non-musical)) 
                   (set! (ly:grob-property grob 'line-break-permission) 'force) 
                   (set! (ly:grob-property grob 'line-break-permission) '()))))))))) 

\score {
\relative c' {
  \key f \major
  \time 3/4
  c2.(   | f2   cis4  | e2 d4 | d2.)   | %m01-04
  d2.    | bes'2 fis4 | a2 g4 | g a bes  | %m05-08
  c c c  | e e e      | c2.~  | c4 a bes | %m09-12
  c c c  | e e e      | c2.~  | c4 r r   | %m13-16
       % 
  c,2.   | f2   cis4  | e2 d4 | d2.      | %m17-20
  d2.    | bes'2 fis4 | a2 g4 | g a bes  | %m21-24
  c2 c4  | g'2 f4     | fis,4. g8 fis g  | e'2 d4 | %m25-28
  c4 c c | c2  c4     | c2.~  | c2 r4    | %m29-32
       % 
}
 \header {
  % title    = "Shades"
  % subtitle = "from Bayadere"
  % composer = "Ludwig Minkus"
  piece = "Some day my prince will come"
 }
}

\layout { 
  \context { 
    \Score 
    %% the following line necessary if you want to put more 
    %% measures to a line than Lily wants to allow 
    \override NonMusicalPaperColumn #'line-break-permission = ##f 
    \consists #(line-break-every-nth-engraver 8) 
  } 
} 
