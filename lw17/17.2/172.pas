PROGRAM Digit(INPUT, OUTPUT);
VAR
  I: INTEGER;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN  {ReadDigit}
  READ(F, Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 ELSE
  D := -1
END;{ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{Преобазует строку цифр из файла до первого нецифрового символа,
 в соответствующее целое число N}
VAR
  Digit: INTEGER; 
BEGIN{ReadNumber}
  Digit := 0;
  N:=0; 
  WHILE (NOT EOLN) AND (Digit <> -1) AND ( N <> -1)
  DO
    BEGIN 
      ReadDigit(INPUT, Digit);
      IF (Digit <> -1)
      THEN 
        IF (N < MAXINT DIV 10) OR (( MAXINT MOD 10 > Digit) AND (MAXINT DIV 10 = N))
        THEN 
          N := N * 10 + Digit
        ELSE
          IF(N > MAXINT DIV 10)
          THEN     
            N := -1
    END        
END;{ReadNumber}

BEGIN {Digit}
  I := 0;
  ReadNumber(INPUT, I);
  WRITELN(I)
END. {Digit}
