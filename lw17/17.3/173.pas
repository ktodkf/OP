PROGRAM Stat(INPUT, OUTPUT);
VAR
  Min, Max, Sum, Digit, CountDigit: INTEGER;
  Overflow: BOOLEAN;
  
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
{Преобразует строку цифр из файла до первого нецифрованного символа,
в соответствующее целое цисло N}
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
BEGIN
  Max := 0;
  Min := MAXINT;
  Sum := 0;
  Digit := 0;
  CountDigit := 0;
  Overflow := FALSE;
  WHILE (NOT Overflow) AND (NOT EOLN)
  DO
    BEGIN
      ReadNumber(INPUT, Digit);
      Overflow := (CountDigit >= MAXINT - 1) OR (Digit = -1) OR (Sum > (MAXINT - Digit));
      IF Overflow
      THEN
        WRITELN('Введено неверное значение или переполнение')
      ELSE
        BEGIN 
          CountDigit := CountDigit + 1;
          Sum := Sum + Digit;
          IF (Max < Digit)
          THEN
            Max := Digit;
          IF (Min > Digit)
          THEN
            Min := Digit;  
        END  
    END;
  IF (NOT Overflow)
  THEN
    BEGIN
      IF (CountDigit > 0)
      THEN
        BEGIN
          WRITELN('Min= ', Min);
          WRITELN('Max= ', Max);
          WRITELN('Average= ', Sum DIV CountDigit, '.', Sum MOD CountDigit * 100 DIV CountDigit);
        END
      ELSE
        WRITELN('Ничего не введено')
    END    
END.  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
