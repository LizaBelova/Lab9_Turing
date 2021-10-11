program lab99;
uses SysUtils;
var str: string;
    loc,st: integer;
procedure auto(poz: integer);
var temp: boolean;
begin
    temp:=true;
    if (st=1)and(temp) then begin
        if str[poz+1]='#' then begin
            st:=2;
            inc(poz);
            temp:=false;
            writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
        end;
    end;
    if (st=2)and(temp) then begin
        if (str[poz+1]='0')and(temp) then begin
            inc(poz);
            temp:=false;
            writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
        end;
        if (str[poz+1]='1')and(temp) then begin
            inc(poz);
            temp:=false;
            writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
        end;
        if (str[poz+1]='#')and(temp) then begin
            st:=3;
            insert('0',str,poz+1);
            inc(poz);
            temp:=false;
            writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
        end;
    end;
    if (st=3)and(temp) then begin
        if (str[poz+1]='#')and(temp) then begin
            st:=0;
            inc(poz);
            temp:=false;
            writeln(output,'Position: ',poz,', Status: Q',st,', Tape: ',str);
        end;
    end;
    loc:=poz;
end;
begin
    assign(input, 'Input_lab99.txt');
    reset(input);
    assign(output,'Output_lab99.txt');
    rewrite(output);
    read(input,str);
    str:='#'+str+'#';
    loc:=0; st:=1;
    writeln(output,'Position: ',loc,', Status: Q',st,', Tape: ',str);
    while st<>0 do auto(loc);
    write('over');
    close(input);
    close(output);
end.
