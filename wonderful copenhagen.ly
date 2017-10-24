\version "2.18.0"

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
 \relative c'' {
  \key c \major
  \time 3/4
  g4. fis8 g4  | g4. fis8 g4 | b2 a4      | g2 f4  | %m01-04
  e4. dis8 e4  | e4. dis8 e4 | g2.~       | g4 f e | %m05-08
  d4. f8   a4~ | a   f    d  | c4. e8 g4~ | g a b  | %m09-12
  c2       a4  | g2       e4 | d2.~       | d2  r4 | %m13-16
       % 
  g4. fis8 g4  | g4. fis8 g4 | b2 a4      | g2 f4  | %m01-04
  e4. dis8 e4  | e4. dis8 e4 | g2.~       | g4 f e | %m05-08
  d4. f8   a4~ | a   f    d  | c4. e8 g4~ | g a b  | %m09-12
  % c2       a4  | g2       e4 | c'4. a8 g4 | e4. d8 c4 | %m13-16
  c2      a4  | d4. c8 b4 | c2.~ | c |

}
 \header {
  % title    = "Shades"
  % subtitle = "from Bayadere"
  % composer = "Ludwig Minkus"
  piece = "Wonderful Copenhagen"
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
