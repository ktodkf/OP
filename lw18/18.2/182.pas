PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Lastname : TEXT;
  Ch : CHAR;
  
PROCEDURE CopyLastname(VAR InpF, OutF: TEXT);
VAR
  Ch: CHAR;
BEGIN{CopyLastname}
  WHILE NOT(EOLN) AND (Ch <> ' ')
  DO
    BEGIN
      READ(InpF, Ch);
      WRITE(OutF, Ch)
    END;
END;{CopyLastname} 
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(Lastname);
      IF NOT(EOLN)
      THEN
        CopyLastname(INPUT, Lastname) ;
      WRITELN(Lastname, ' ');
      RESET(Lastname);
      WHILE (WhichScore <= NumberOfScores) AND NOT(EOLN)
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore < 0) OR (NextScore > 100)
          THEN
            WRITELN('Некорректные данные: ', NextScore)
          ELSE
            BEGIN   
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1 
            END
        END;   
      READLN;
      CopyLastname(Lastname, OUTPUT);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITE(Ave DIV 10 + 1)
      ELSE
        WRITE(Ave DIV 10);  
      ClassTotal := ClassTotal + TotalScore;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.',  ClassTotal MOD 10:1)
END.  {AverageScore}

