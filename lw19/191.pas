PROGRAM Prime(INPUT, OUTPUT);
CONST 
  Min = 2;
  Max = 100;
VAR 
  Sieve : SET OF Min..Max;
  Next, Total : INTEGER;
BEGIN{Prime}
      Sieve := [Min..Max];
      Next := Min;
      Total := Min;
      WRITELN('ПРОСТЫЕ ЧИСЛА В ДИАПАЗОНЕ ДО ', Max, ': ');
      WHILE Next <= Max
      DO 
        BEGIN
          WHILE Total <= Max
          DO 
            BEGIN
              Sieve := Sieve - [Total];
              Total := Next + Total
            END;
          WRITE(Next, ' ');
          WHILE (Next <= Max) AND (NOT(Next IN Sieve))
          DO
            Next := Next + 1;
            Total := Next    
        END;
      WRITELN(OUTPUT)
END.{Prime}     
