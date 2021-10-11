program lab9_bin;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function Bin(const s: string): LongInt;
var
    i: Integer;
    r: LongInt;
begin
  r:=0;
  for i:=1 to Length(s) do begin
    if (s[i]='1') or (s[i]='0') then
    r:=r*2 + (ord(s[i]) - Ord('0'))
    else begin
      Bin:= -i;
      Exit;
    end;
  end;
  Bin:=r;
end;

function dec2(dec: LongInt): string;
begin
  if dec=0 then dec2:=' '
  else
  if Odd(dec) then dec2:=dec2(dec div 2) + '1'
  else             dec2:=dec2(dec div 2) + '0'
end;

var
  s: string;
  d1, d2: LongInt;
begin
  Write('Input binary number:',#9#9);
  readln(s);
  d1:=Bin(s);
  if d1<0 then begin Writeln('Error(',s,')!'); Halt(1) end;
  Write('Input 2 in binary system:',#9);
  readln(s);
  d2:=Bin(s);
  if d2<0 then begin Writeln('Error(',s,')!'); Halt(1) end;
  Writeln('Ansver (in binary system):',#9,dec2(d1*d2));
  Readln;
  Readln;
end.
