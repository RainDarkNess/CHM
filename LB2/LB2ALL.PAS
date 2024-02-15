uses crt; 
const n:byte = 3; 
 dw = 0.2; 
type TMatr = array[1..4,1..4+1] of real; 
 TVector = array[1..4] of real; 
const eps = 0.001; 
var a:TMatr; b,b1:TVector; 
 i,j,k:integer; 
 w,buf:real; 
 ch:char; 
procedure Yakoby(var a:TMatr;var b:TVector; n:integer; var step:integer); 
var x0,x:TVector; 
 i,j,k:integer; 
 e:real; 
begin 
 step:=0; 
 for i:=1 to n do x0[i]:=b[i]/a[i,i]; 
 repeat 
 for i:=1 to n do begin 
 x[i]:=b[i]/a[i,i]; 
 for j:=1 to i-1 do x[i]:=x[i] - a[i,j]*x0[j]/a[i,i]; 
 for j:=i+1 to n do x[i]:=x[i] - a[i,j]*x0[j]/a[i,i]; 
 end; 
 e:=0; 
 for i:=1 to n do begin 
 if abs(x[i] - x0[i])>e then e:=abs(x[i] - x0[i]); 
 x0[i]:=x[i]; 
 end; 
 inc(step); 
 until e<=eps; 
 b:=x0; 
end; 
procedure Zeidel(var a:TMatr;var b:TVector;n:integer; var step:integer); 
var x0,x:TVector; 
 i,j,k:integer; 
 e:real; 
begin 
 step:=0; 
 for i:=1 to n do x0[i]:=b[i]/a[i,i]; 
 repeat 
 for i:=1 to n do begin 
 x[i]:=b[i]/a[i,i]; 
 for j:=1 to i-1 do x[i]:=x[i] - a[i,j]*x[j]/a[i,i]; 
 for j:=i+1 to n do x[i]:=x[i] - a[i,j]*x0[j]/a[i,i]; 
 end; 
e:=0; 
 for i:=1 to n do begin 
 if abs(x[i] - x0[i])>e then e:=abs(x[i] - x0[i]); 
 x0[i]:=x[i]; 
 end; 
 inc(step); 
 until e<=eps; 
 b:=x0; 
end; 
procedure ZeidelEx(var a:TMatr;var b:TVector;n:integer; var step:integer; w:real); 
var x0,x:TVector; 
 i,j,k:integer; 
 e:real; 
const eps = 0.0001; 
begin 
 step:=0; 
 for i:=1 to n do x0[i]:=b[i]/a[i,i]; 
 repeat 
 for i:=1 to n do begin 
 x[i]:=w*b[i]/a[i,i]+(1-w)*x0[i]; 
 for j:=1 to i-1 do x[i]:=x[i] - w*a[i,j]*x[j]/a[i,i]; 
 for j:=i+1 to n do x[i]:=x[i] - w*a[i,j]*x0[j]/a[i,i]; 
 end; 
 e:=0; 
 for i:=1 to n do begin 
 if abs(x[i] - x0[i])>e then e:=abs(x[i] - x0[i]); 
 x0[i]:=x[i]; 
 end; 
 inc(step); 
 until e<=eps; 
 b:=x0; 
end; 
function Proverka(a:TMatr):boolean; 
var i,j:byte; 
begin 
 Proverka:=true; 
 for i:=1 to n do 
 if a[i,i] = 0 then begin 
 proverka:=false; exit; 
 end; 
end; 
procedure Out_Slau_T(a:tMatr; b:TVector); 
var i,j:byte; 
begin 
 Writeln('Исходная система :'); 
 for i:=1 to n do begin 
 for j:=1 to n do 
 if a[i,j]<0 then write(' - ',abs(a[i,j]):0:4,'x',j) 
 else write(' +', abs(a[i,j]):0:4,'x',j); 
if b[i]<0 then write(' = ',' - ',abs(b[i]):0:4) 
 else write(' = ',abs(b[i]):0:4); 
 WriteLn; 
 end; 
 WriteLn; 
end; 
procedure ReadMatr(var a:tMatr); 
var i,j:byte; 
begin 
 fillchar(a,sizeof(a),0); 
 for i:=1 to n do begin 
 Write('=>'); 
 for j:=1 to n do read(a[i,j]); 
 Writeln; 
 end; 
 end; 
procedure ReadVector(var b:TVector); 
var i:byte; 
begin 
 fillchar(b,sizeof(b),0); 
 Write('=>'); 
 for i:=1 to n do read(b[i]); 
end; 
begin 
 ClrScr; 
 a[1,1]:=23.8;  a[1,2]:=0.1010; a[1,3]:=0.1212; a[1,4]:=0.1414; b[1]:=50.8968; 
 a[2,1]:=0.757; a[2,2]:=22.9;   a[2,3]:=0.1161; a[2,4]:=0.1363; b[2]:=53.4873; 
 a[3,1]:=0.707; a[3,2]:=0.909;  a[3,3]:=22; 	a[3,4]:=0.1313; b[3]:=55.7118; 
 a[4,1]:=0.656; a[4,2]:=0.0858; a[4,3]:=0.1060; a[4,4]:=1.1;    b[4]:=57.5703; 
Out_Slau_T(a,b); b1:=b; 
 Writeln('Решение по методу Якоби:'); 
 Yakoby(a,b,n,k); 
 for i:=1 to n do write('x',i,' = ',b[i]:0:3,' '); 
 Writeln('Число итераций = ',k); 
 Writeln; 
 b:=b1; 
 Zeidel(a,b,n,k); 
 Writeln(' Решение по методу Зейделя:'); 
 for i:=1 to n do write('x',i,' = ',b[i]:0:3,' '); 
Writeln('Число итераций = ',k); 
Writeln; 
 w:=0.2; 
 Writeln('Решение по обобщенному методу Зейделя:'); 
 while w<2.0 do begin 
 b:=b1; 
 ZeidelEx(a,b,n,k,w); 
 for i:=1 to n do write('x',i,' = ',b[i]:0:3,'|'); 
 writeln('Число W = ',w:0:1,'Число k = ',k); 
 w:=w+dw; 
 end; 
Writeln('Приступить к решению системы? [y/n]'); 
 Readln(ch); 
 if ch<>'y' then halt(0); 
 ClrScr; 
 Writeln('Введите N'); 
 Readln(n); 
Writeln; 
 ReadMatr(a); 
 ReadVector(b); 
 b1:=b; 
Out_Slau_T(a,b1); 
Writeln(' Решение по методу Якоби:'); 
 Yakoby(a,b,n,k); 
 for i:=1 to n do write('x',i,' = ',b[i]:0:3,' '); 
 Writeln(' Число итераций = ',k); 
Writeln; 
 b:=b1; 
 Zeidel(a,b,i,j);
 Writeln(' Решение по методу Зейделя:'); 
 for i:=1 to n do write('x',i,' = ',b[i]:0:3,' '); 
 Writeln('Число итераций = ',k); 
 Writeln; 
 w:=0.2; 
 Writeln(' Решение по обобщенному методу Зейделя:'); 
 while w<2.0 do begin 
 b:=b1; 
 ZeidelEx(a,b,n,k,w); 
 for i:=1 to n do write('x',i,' = ',b[i]:0:3,'|'); 
 writeln( 'Число W = ',w:0:1,'| Число итераций = ',k); 
 w:=w+dw; 
 end; 
 ReadLn;Readln; 
end. 