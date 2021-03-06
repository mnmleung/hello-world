
%% LilyPond file generated by Denemo version 2.0.2

%%http://www.gnu.org/software/denemo/

% 2017-10-15 23:09:29 Sun 
% created on HP
% saved to dropbox
% picked up on amelia3 windows 10 by Fescobaldi
% Kingdom of Shades from la Bayadere by Minkus

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
 {
  \time 6/8
  \acciaccatura { d''16 f'' } b''4. a''   | %m01
  \acciaccatura { a'16  d'' } g''4. fis'' | %m02
  \acciaccatura { fis'16  a' } e''4. d''  | %m03
         d''2. | 
       % 05
         \acciaccatura { b'16  d''  } g''4. fis''|
         e'' d''|
         cis'' b'|
         b'2. |
       % 09
         fis''4. e'' |
         \acciaccatura { dis''16  e'' fis''  } e''4. r |
         b'' a'' |
         \acciaccatura { gis''16  a'' b''  } a''4. r |
       % 13
         d''' cis'''
         cis''' b''
         a''2.
         a'''4. r
       % 17
         b''4. a''|
         g'' fis''|
         e'' d''|
         d''2. |
       % 21
         g''4. fis''|
         e'' d''|
         cis'' b'|
         b'2. |
       %
         fis''4. e'' |
         e'' r |
         b'' a'' |
         a'' r |
       %
         bes'' a''
         b'' a''
         d''2.
         d'''4. r
       % 

 }
 \header {
  % title    = "Shades"
  % subtitle = "from Bayadere"
  % composer = "Ludwig Minkus"
  piece = "Shades: from Bayadere"
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
