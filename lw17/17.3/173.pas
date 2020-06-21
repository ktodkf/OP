PROGRAM Stat(INPUT, OUTPUT);
VAR
  Min, Max, Sum, Number, CountDigit: INTEGER;
  Overflow: BOOLEAN;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  READ(F, Ch);
  D := -1;
  IF (Ch = '0') THEN D := 0 ELSE
  IF (Ch = '1') THEN D := 1 ELSE
  IF (Ch = '2') THEN D := 2 ELSE
  IF (Ch = '3') THEN D := 3 ELSE
  IF (Ch = '4') THEN D := 4 ELSE
  IF (Ch = '5') THEN D := 5 ELSE
  IF (Ch = '6') THEN D := 6 ELSE
  IF (Ch = '7') THEN D := 7 ELSE
  IF (Ch = '8') THEN D := 8 ELSE
  IF (Ch = '9') THEN D := 9 
END;{ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа,
 в соответствующее целое число N}
VAR
  Digit: INTEGER; 
BEGIN{ReadNumber}
  Digit := 0;
  N:=0; 
  WHILE (Digit <> -1) AND ( N <> -1)
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

BEGIN{Stat}
  Max := 0;
  Min := MAXINT;
  Sum := 0;
  Number := 0;
  CountDigit := 0;
  Overflow := FALSE;
  WHILE (NOT Overflow) AND (NOT EOLN)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      Overflow := (CountDigit >= MAXINT - 1) OR (Number = -1) OR (Sum > (MAXINT - Number));
      IF Overflow
      THEN
        WRITELN('Введено неверное значение или переполнение')
      ELSE
        BEGIN 
          CountDigit := CountDigit + 1;
          Sum := Sum + Number;
          IF (Max < Number)
          THEN
            Max := Number;
          IF (Min > Number)
          THEN
            Min := Number;  
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
END.{Stat}  
