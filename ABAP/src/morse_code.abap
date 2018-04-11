REPORT morse_code.

" URL: http://www.rosettacode.org/wiki/Morse_code

TYPES: BEGIN OF y_morse_code,
         letter TYPE string,
         code   TYPE string,
       END OF y_morse_code,
       ty_morse_code TYPE STANDARD TABLE OF y_morse_code WITH EMPTY KEY.
 
cl_demo_output=>new(
          )->begin_section( |Morse Code|
          )->write( REDUCE stringtab( LET words = VALUE stringtab( ( |sos|                 )
                                                                   ( |   Hello     World!| )
                                                                   ( |Rosetta Code|        ) )
                                          morse_code = VALUE ty_morse_code( ( letter = 'A'   code = '.-     ' )
                                                                            ( letter = 'B'   code = '-...   ' )
                                                                            ( letter = 'C'   code = '-.-.   ' )
                                                                            ( letter = 'D'   code = '-..    ' )
                                                                            ( letter = 'E'   code = '.      ' )
                                                                            ( letter = 'F'   code = '..-.   ' )
                                                                            ( letter = 'G'   code = '--.    ' )
                                                                            ( letter = 'H'   code = '....   ' )
                                                                            ( letter = 'I'   code = '..     ' )
                                                                            ( letter = 'J'   code = '.---   ' )
                                                                            ( letter = 'K'   code = '-.-    ' )
                                                                            ( letter = 'L'   code = '.-..   ' )
                                                                            ( letter = 'M'   code = '--     ' )
                                                                            ( letter = 'N'   code = '-.     ' )
                                                                            ( letter = 'O'   code = '---    ' )
                                                                            ( letter = 'P'   code = '.--.   ' )
                                                                            ( letter = 'Q'   code = '--.-   ' )
                                                                            ( letter = 'R'   code = '.-.    ' )
                                                                            ( letter = 'S'   code = '...    ' )
                                                                            ( letter = 'T'   code = '-      ' )
                                                                            ( letter = 'U'   code = '..-    ' )
                                                                            ( letter = 'V'   code = '...-   ' )
                                                                            ( letter = 'W'   code = '.-   - ' )
                                                                            ( letter = 'X'   code = '-..-   ' )
                                                                            ( letter = 'Y'   code = '-.--   ' )
                                                                            ( letter = 'Z'   code = '--..   ' )
                                                                            ( letter = '0'   code = '-----  ' )
                                                                            ( letter = '1'   code = '.----  ' )
                                                                            ( letter = '2'   code = '..---  ' )
                                                                            ( letter = '3'   code = '...--  ' )
                                                                            ( letter = '4'   code = '....-  ' )
                                                                            ( letter = '5'   code = '.....  ' )
                                                                            ( letter = '6'   code = '-....  ' )
                                                                            ( letter = '7'   code = '--...  ' )
                                                                            ( letter = '8'   code = '---..  ' )
                                                                            ( letter = '9'   code = '----.  ' )
                                                                            ( letter = ''''  code = '.----. ' )
                                                                            ( letter = ':'   code = '---... ' )
                                                                            ( letter = ','   code = '--..-- ' )
                                                                            ( letter = '-'   code = '-....- ' )
                                                                            ( letter = '('   code = '-.--.- ' )
                                                                            ( letter = '.'   code = '.-.-.- ' )
                                                                            ( letter = '?'   code = '..--.. ' )
                                                                            ( letter = ';'   code = '-.-.-. ' )
                                                                            ( letter = '/'   code = '-..-.  ' )
                                                                            ( letter = '_'   code = '..--.- ' )
                                                                            ( letter = ')'   code = '---..  ' )
                                                                            ( letter = '='   code = '-...-  ' )
                                                                            ( letter = '@'   code = '.--.-. ' )
                                                                            ( letter = '\'   code = '.-..-. ' )
                                                                            ( letter = '+'   code = '.-.-.  ' )
                                                                            ( letter = ' '   code = '/'       ) )
                                      IN INIT word_coded_tab TYPE stringtab
                                          FOR word IN words
                                         NEXT word_coded_tab = VALUE #( BASE word_coded_tab ( REDUCE string( INIT word_coded TYPE string
                                                                                                              FOR index = 1 UNTIL index > strlen( word )
                                                                                                              LET _morse_code = VALUE #( morse_code[ letter = COND #( WHEN index = 1 THEN to_upper( word(index) )
                                                                                                                                                                      ELSE LET prev = index - 1 IN to_upper( word+prev(1) ) ) ]-code OPTIONAL )
                                                                                                               IN NEXT word_coded = |{ word_coded } { _morse_code }| ) ) ) )
          )->display( ).
