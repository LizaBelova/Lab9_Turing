type
  rez = record
    d: string;
    o: boolean;
  end;

var
     f: array [1..100] of rez;
     t: array [1..100] of rez;
  used: array [1..100] of boolean;
  i, n: integer;
     c: boolean;

procedure answer;
begin
  writeln('S={¬PvQ, ¬RvS, PvR, ¬Qv¬S, QvS, Qv¬R, ¬PvS, ¬Pv¬R}');
  writeln('S={¬PvQ, ¬RvS, PvR, QvS, ¬PvS, ¬Pv¬R, ¬Sv¬R}');
  writeln('S={¬PvQ, ¬RvS, QvS, ¬PvS, ¬Pv¬R, Pv¬S}');
  writeln('S={¬RvS, QvS, ¬PvS, ¬Pv¬R, Qv¬S}');
  writeln('S={¬RvS, QvS, ¬PvS, ¬Pv¬R, ¬S}');
  writeln('S={¬RvS, QvS, ¬Pv¬R, ¬S, RvS}');
  writeln('S={QvS, ¬Pv¬R, ¬S, S}');
  writeln('S={QvS, ¬Pv¬R, 0}');
  writeln('Solution');
end;

procedure find_solution(var m: integer);
var
  i, j, k: integer;
begin
  if (c = true) and (f[m].d <> '') then begin
    for i := 1 to m do 
      if used[i] = false then begin
        for j := 1 to m do 
          if (i <> j) and (used[j] = false) then begin
            if j = 1 then writeln;
            if (t[i].d <> '') and (t[j].d <> '') then begin
              if (f[i].d = f[j].d) and (f[i].o <> f[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                if (t[i].d <> t[j].d) then begin
                  f[m].d := t[i].d; f[m].o := t[i].o;
                  t[m].d := t[j].d; t[m].o := t[j].o;
                end else begin
                  f[m].d := t[i].d; f[m].o := t[i].o;
                  t[m].d := ''; t[m].o := true;
                end;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; t[m].d := '';
                dec(m);
              end else if (t[i].d = t[j].d) and (t[i].o <> t[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                if (f[i].d <> f[j].d) then begin
                  f[m].d := f[i].d; f[m].o := f[i].o;
                  t[m].d := f[j].d; t[m].o := f[j].o;
                end else begin
                  f[m].d := f[i].d; f[m].o := f[i].o;
                  t[m].d := ''; t[m].o := true;
                end;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; t[m].d := '';
                dec(m);
              end else if (f[i].d = t[j].d) and (f[i].o <> t[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                if (t[i].d <> f[j].d) then begin
                  f[m].d := t[i].d; f[m].o := t[i].o;
                  t[m].d := f[j].d; t[m].o := f[j].o;
                end else begin
                  f[m].d := t[i].d; f[m].o := t[i].o;
                  t[m].d := ''; t[m].o := true;
                end;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; t[m].d := '';
                dec(m);
              end else if (t[i].d = f[j].d) and (t[i].o <> f[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                if (f[i].d <> t[j].d) then begin
                  f[m].d := f[i].d; f[m].o := f[i].o;
                  t[m].d := t[j].d; t[m].o := t[j].o;
                end else begin
                  f[m].d := f[i].d; f[m].o := f[i].o;
                  t[m].d := ''; t[m].o := true;
                end;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; t[m].d := '';
                dec(m);
              end;
            end else if (t[i].d <> '') and (t[j].d = '') then begin
              if (f[i].d = f[j].d) and (f[i].o <> f[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                f[m].d := t[i].d; f[m].o := t[i].o;
                t[m].d := ''; t[m].o := true;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; dec(m);
              end else if (t[i].d = f[j].d) and (t[i].o <> f[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                f[m].d := f[i].d; f[m].o := f[i].o;
                t[m].d := ''; t[m].o := true;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; dec(m);
              end;
            end else if (t[j].d <> '') and (t[i].d = '') then begin
              if (f[i].d = f[j].d) and (f[i].o <> f[j].o) then begin
                used[i] := true; used[j] := true; inc(m);
                f[m].d := t[j].d; f[m].o := t[j].o;
                t[m].d := ''; t[m].o := true;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; dec(m);
              end else if (t[j].d = f[i].d) and (t[j].o <> f[i].o) then begin
                used[i] := true; used[j] := true; inc(m);
                f[m].d := t[i].d; f[m].o := t[i].o;
                t[m].d := ''; t[m].o := true;
                write('S={');
                for k := 1 to m - 1 do 
                  if used[k] = false then begin
                    if f[k].o = false then write('¬');
                    write(f[k].d);
                    if t[k].d <> '' then begin
                      write('v');
                      if t[k].o = false then write('¬');
                      write(t[k].d, ', ');
                    end;
                  end;
                if f[m].o = false then write('¬');
                write(f[m].d);
                if t[m].d <> '' then begin
                  write('v');
                  if t[m].o = false then write('¬');
                  write(t[m].d);
                end;
                writeln('}');
                find_solution(m);
                used[i] := false; used[j] := false;
                f[m].d := ''; dec(m);
              end;
            end else if (t[j].d = '') and (t[i].d = '') then begin
              if (f[i].d = f[j].d) and (f[i].o <> f[j].o) then begin
                inc(m); c := false;
                writeln('Rez', m, ': Proof');
                dec(m);
              end;
            end;
          end;
      end;
  end else exit;
end;

begin
  n := 8; writeln('((P>Q)^(R>S)^(PvR)^¬(Q^S))>((Q>P)^(S>R))');
  f[1].d := 'P'; f[1].o := false; t[1].d := 'Q'; t[1].o := true;
  f[2].d := 'R'; f[2].o := false; t[2].d := 'S'; t[2].o := true;
  f[3].d := 'P'; f[3].o := true; t[3].d := 'R'; t[3].o := true;
  f[4].d := 'Q'; f[4].o := false; t[4].d := 'S'; t[4].o := false;
  f[5].d := 'Q'; f[5].o := true; t[5].d := 'S'; t[5].o := true;
  f[6].d := 'Q'; f[6].o := true; t[6].d := 'R'; t[6].o := false;
  f[7].d := 'P'; f[7].o := false; t[7].d := 'S'; t[7].o := true;
  f[8].d := 'P'; f[8].o := false; t[8].d := 'R'; t[8].o := false;
  for i := 1 to n do used[i] := false;
  write('S={');
  for i := 1 to n - 1 do 
  begin
    if f[i].o = false then write('¬');
    write(f[i].d, 'v');
    if t[i].o = false then write('¬');
    write(t[i].d, ', ');
  end;
  if f[n].o = false then write('¬');
  write(f[n].d, 'v');
  if t[n].o = false then write('¬');
  writeln(t[n].d, '}'); c := true;
  find_solution(n);
  answer;
end.