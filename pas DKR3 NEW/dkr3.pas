program DKR3;
uses crt;
var input: byte;

function vib(var v:byte): byte;
begin
  writeln('Да - 1');
  writeln('Нет - 0');
  readln(v);
  vib:=v;
  writeln;
end;

function fun(var x:real): real;
var fo:real;
begin
  fo:=1*power(x,3)+(-2)*power(x,2)+(-4)*x+7;
  fun:=fo;
end;

function fun1(var x:real): real;
var fo: real;
begin
  fo:=((power(x,4))/4)+(((-2)*power(x,3))/3)+(((-4)*sqr(x))/2)+7*x;
  fun1:=fo;
end;

function mainfun: integer;
var a,b,h,f,x,s:real; n: integer;
begin
  ClrScr;
  Writeln('Вычисление площади фигуры, ограниченной кривой 2*x^3+x^2+(-4)*x+15 и осью Ох (в положительной части по оси Оу)');
  print('Введите пределы интегрирования a и b и количество разбиений n:');
  readln(a,b,n);
  h:=(b-a)/n;
  x:=a+(h/2);
  for var i:=0 to n do
  begin
    f:=fun(x);
    s:=s+f;
    x:=x+h;
  end;
  s:=s*h;
  writeln('Ответ ',s:10:3);
  writeln;
  writeln('Вывести погрешность ?');
  input:=vib(input);
  case input of
    1:
      begin
        writeln('Погрешность =',abs((fun1(b)-fun1(a))-s):10:3);
      end;
  end;
  writeln;
  writeln('Начать заново?');
  input:=vib(input);
  case input of
    1: mainfun;
    0: exit();
  end;
  mainfun:=0;
end;

begin
  Writeln('Вычисление площади фигуры, ограниченной кривой 1*x^3+(-2)*x^2+(-4)*x+7 и осью Ох (в положительной части по оси Оу)');
  Writeln('Вычислить площадь ?');
  input:=vib(input);
  case input of
    1: mainfun;
    0: exit;
  end;
end.