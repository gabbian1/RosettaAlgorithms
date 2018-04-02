REPORT soundex.

"URL: http://www.rosettacode.org/wiki/Soundex

"This is a incomplete version.

    cl_demo_output=>new(
              )->begin_section( |SoundEx in ABAP|
              )->write( REDUCE stringtab(  LET string_list = VALUE stringtab( ( |Soundex|     )
                                                                              ( |Example|     )
                                                                              ( |Sownteks|    )
                                                                              ( |Ekzampul|    )
                                                                              ( |Euler|       )
                                                                              ( |Gauss|       )
                                                                              ( |Hilbert|     )
                                                                              ( |Knuth|       )
                                                                              ( |Lloyd|       )
                                                                              ( |Lukasiewicz| )
                                                                              ( |Ellery|      )
                                                                              ( |Ghosh|       )
                                                                              ( |Heilbronn|   )
                                                                              ( |Kant|        )
                                                                              ( |Ladd|        )
                                                                              ( |Lissajous|   )
                                                                              ( |Wheaton|     )
                                                                              ( |Ashcraft|    )
                                                                              ( |Burroughs|   )
                                                                              ( |Burrows|     )
                                                                              ( |O'Hara|      ) ) IN
                                          INIT soundex TYPE stringtab
                                           FOR string IN string_list
                                          NEXT soundex = VALUE #( BASE soundex ( |{ string } => { REDUCE string( INIT _soundex TYPE char4
                                                                                                                  FOR letter = 1 UNTIL letter > strlen( string )
                                                                                                                  LET prev_char = letter - 1
                                                                                                                      next_char = COND #( WHEN letter = 1 THEN string(letter)
                                                                                                                                          ELSE SWITCH #( to_upper( string+prev_char(1) )
                                                                                                                                                         WHEN 'A' OR 'E' OR 'I' OR 'O' OR 'U' THEN ' '
                                                                                                                                                         WHEN 'B' OR 'F' OR 'P' OR 'V'        THEN '1'
                                                                                                                                                         WHEN 'C' OR 'G' OR 'J' OR 'K' OR
                                                                                                                                                              'Q' OR 'S' OR 'X' OR 'Z'        THEN '2'
                                                                                                                                                         WHEN 'D' OR 'T'                      THEN '3'
                                                                                                                                                         WHEN 'L'                             THEN '4'
                                                                                                                                                         WHEN 'M' OR 'N'                      THEN '5'
                                                                                                                                                         WHEN 'R'                             THEN '6'
                                                                                                                                                         ELSE ' ' ) )
                                                                                                                   IN NEXT _soundex = |{ _soundex }{ next_char }| ) }| ) ) )
              )->display( ).
