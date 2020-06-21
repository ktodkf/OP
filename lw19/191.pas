PROGRAM Prime(INPUT, OUTPUT);
CONST 
  Min = 2;
  Max = 100;
VAR 
  Sieve : SET OF Min..Max;
  Next, Count : INTEGER;
BEGIN{Prime}
  Sieve := [Min..Max];
  Next := Min;
  Count := Min;
  WRITELN('ПРОСТЫЕ ЧИСЛА В ДИАПАЗОНЕ ДО ', Max, ': ');
  WHILE Next <= Max
  DO 
    BEGIN
      WHILE Count <= Max
      DO 
        BEGIN
          Sieve := Sieve - [Count];
          Count := Next + Count
        END;
      WRITE(Next, ' ');
      WHILE (Next <= Max) AND (NOT(Next IN Sieve))
      DO
        Next := Next + 1;
        Count := Next    
    END;
  WRITELN(OUTPUT)
END.{Prime}     
