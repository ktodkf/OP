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
{����������� ������ ���� �� ����� �� ������� ����������� �������,
 � ��������������� ����� ����� N}
VAR
  Digit: INTEGER; 
  Owerflow: BOOLEAN;
BEGIN{ReadNumber}
  Owerflow := FALSE;
  Digit := 0;
  N:=0;
  ReadDigit(INPUT, Digit);
  WHILE (NOT Owerflow) AND (Digit <> -1) 
  DO
    BEGIN 
      IF (N <= MAXINT DIV 10)
      THEN
        BEGIN
          N := N * 10;
          IF (Digit <= MAXINT - N)
          THEN  
            N := N + Digit
          ELSE 
            Owerflow := TRUE
        END
      ELSE
        Owerflow := TRUE; 
      ReadDigit(INPUT, Digit);
    END;
  IF Owerflow 
  THEN     
    N := -1
END;{ReadNumber}

BEGIN {Digit}
  ReadNumber(INPUT, I);
  WRITELN(I)
END. {Digit}

