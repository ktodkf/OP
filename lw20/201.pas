PROGRAM XPrint(INPUT, OUTPUT);
VAR
  Ch: CHAR;
    
PROCEDURE Print(VAR Ch: CHAR);
CONST
  Min = 1;
  Max =25;
  Symbole = 'X';
VAR
  Sieve: SET OF Min..Max;
  I : INTEGER;
BEGIN{Print}
  CASE Ch OF
    'A': Sieve := [3, 7, 9, 12, 14, 16 .. 21, 25];
    'B': Sieve := [1 ..4, 6, 10 .. 14, 16, 20 .. 24 ];  
    'C': Sieve := [1, 2 .. 4, 6, 10, 11, 16, 20, 22 .. 24 ]; 
    'D': Sieve := [1 .. 4, 6, 10, 11, 15, 16, 20 .. 24];
    'E': Sieve := [1 .. 6, 11 .. 16, 21 .. 25]
  ELSE
    Sieve := []  
  END;
  FOR I := Min TO Max
  DO
    BEGIN 
      IF (I IN Sieve)
      THEN 
        WRITE(Symbole) 
      ELSE
        WRITE(' '); 
      IF (I MOD 5 = 0)
      THEN 
        WRITELN
    END
END;{Print}
BEGIN{XPrint} 
  READ(Ch);
  Print(Ch)
END.{XPrint}            
