PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
 и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  Symbols = [' ', 'A' .. 'Z'];
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  StrLen = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  Lenght: StrLen;
 
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize} 
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '%'
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; Lenght: StrLen);
{Выводит символы из Code,соответствующие символам из S}
VAR
  Index: StrLen;
BEGIN{Encode}
  FOR Index := 1 TO Lenght
  DO
    IF S[Index] IN Symbols
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;{Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
    {читать строку в Msg и распечатать ее}
      Lenght := 0;
      WHILE NOT(EOLN) AND (Lenght < Len)
      DO
        BEGIN
          Lenght := Lenght + 1;
          READ(Msg[Lenght]);
        END;     
      READLN;
      {распечатать кодированное сообщение}
      Encode(Msg, Lenght)
    END
END.  {Encryption}
