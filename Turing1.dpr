program Turing1;
uses SysUtils;
var    str: string;
    loc,st: integer;
procedure auto(poz: integer);
var temp: boolean;
begin
    temp:=true;
    if (st=1)and(temp) then begin
        if (str[poz]='#')or(str[poz]='$') then str[poz]:='0';
        st:=2;
        inc(poz);
        temp:=false;
        writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
    end;
    if (st=2)and(temp) then begin
        if (str[poz]='#')or(str[poz]='$') then str[poz]:='0';
        if str[poz]='x' then st:=3;
        inc(poz);
        temp:=false;
        writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
    end;
    if (st=3)and(temp) then begin
            st:=0;
            inc(poz);
            temp:=false;
            writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
    end;
    loc:=poz;
end;
begin
    assign(input, 'Input_Turing1_lab9.txt');
    reset(input);
    assign(output,'Output_Turing1_lab9.txt');
    rewrite(output);
    read(input,str);
    loc:=0; st:=1;
    str:=str+'x';
    writeln(output,'Position: ',loc,', Status: Q',st,', Tape: ',str);
    Inc(loc);
    while st<>0 do auto(loc);
    write('over');
    close(input);
    close(output);
end.
