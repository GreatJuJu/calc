uses GraphABC;
const
  weight=50000;
  x0=200;
  y0=100;
var
  glub, s1sm, s_kuska,shir_kuska,vys_kuska: real;
  narezka, narezka_vert, vis, shir,x,y,i,rez:integer;
  vyvod:string;
label
  restart;
begin
restart: write ('высота проема (см):');
  rez:=0;
  readln (vis);
  writeln (' ',vis);
  write ('ширина проема (см):');
  readln (shir);
  writeln (' ',shir);
  write ('толщина стены (см):');
  readln (glub);
  writeln (' ',glub);
  rez:=shir*2+vis*2;
  s1sm:=2.5*glub;
  s_kuska:=weight/s1sm;
  narezka:=ceil(shir/(sqrt(s_kuska)));
  if sqrt(s_kuska)-shir/narezka>shir/(narezka-1)-sqrt(s_kuska)
    then narezka:=narezka-1;
  rez:=rez+(narezka-1)*vis;
  shir_kuska:=shir/narezka;
  vys_kuska:=s_kuska/shir_kuska;
  narezka_vert:=ceil(vis/vys_kuska)-1;
  rez:=rez+narezka_vert*shir;
  font.color:=clblue;
  writeln ('------------------------------------------');
  writeln ('Длина реза: ',rez,'см');
  writeln ('Вес куска: ',round(shir_kuska)*trunc(vys_kuska)*s1sm/1000,'кг');
  font.color:=clblack;
  pen.Color:=clgreen;
  rectangle (x0,y0,x0+shir,y0+vis);
  x:=x0;y:=y0;
  pen.Color:=clred;
  for i:=1 to narezka-1 do
    begin
    x:=x+round(shir_kuska);
    line (x,y,x,y+vis);
    str (round(shir_kuska),vyvod); 
    textout (x-20,y-10,vyvod)
    end;
    x:=x0;
   for i:=1 to narezka_vert do
    begin
    y:=y+trunc(vys_kuska);
    line (x,y,x+shir,y);
    str (trunc(vys_kuska),vyvod);
    textout (x-10,y-20,vyvod)
    end;
  readln;
  clearwindow;
  goto restart
end.