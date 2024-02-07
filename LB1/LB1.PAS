uses crt; 
type 
Tmatr=array[1..3,1..4]of real; 
Tvector=array[1..3]of real; 
const 
A:tmatr= ((1,1,1,0), 
 (1,0,-1,0), 
 (1,2,1,0)); 
B:Tvector= (6,-2,8); 
var 
k,N:integer;
Procedure vivod_matr(A1:Tmatr;N :integer); 
var 
i,j:integer; 
begin 
For i:=1 to N do begin 
For j:=1 to N do write(A1[i,j]:15,' '); 
writeln; 
End; 
writeln; 
End; 
Procedure vivod_vectr(B1:Tvector; N :integer); 
var 
j:integer; 
begin 
For j:=1 to N do writeln('x',j,'=',B1[j]:0,' '); 
writeln; 
End; 

Procedure holet(A1:Tmatr;var B1:Tvector;N :integer); 
var i,j,t:integer; 
 c,L:Tmatr; 
 y:Tvector; 
 buf,summ:real; 
Begin 
For i:=1 to N do 
 For j:=1 to N +1 do 
 begin 
 c[i,j]:=0; 
 L[i,j]:=0; 
 y[i]:=0; 
 End; 
For i:=1 to N do 
 For j:=1 to N do 
 begin 
 summ:=0.0; 
 For t:=1 to N do 
 summ:=A1[t,j]*A1[t,i]+summ; 
 c[i,j]:=summ;
End; 
For i:=1 to N do 
 For j:=1 to N do 
 y[i]:=A1[j,i]*B1[j]+y[i]; 
For i:=1 to N do For j:=1 to N do 
 begin 
 A1[i,j]:=c[i,j]; 
 B1[i]:=y[i]; 
 End; 
For i:=1 to N do 
 begin 
 For j:=1 to i do 
 begin 
 summ:=0; 
 For t:=1 to j-1 do 
 summ:=summ+L[i,t]*L[j,t]; 
 if i<>j then 
 L[i,j]:=(A1[i,j]-summ)/L[j,j] 
 else 
 L[i,i]:=sqrt(A1[i,i]-summ); 
 End; 
 End; 
For i:=1 to N do L[i,N +1]:=B1[i]; 
B1[1]:=L[1,N +1]/L[1,1]; 
For i:=2 to N do 
 begin 
 For j:=1 to i-1 do 
 L[i,N +1]:=L[i,N +1]-L[i,j]*B1[j]; 
 B1[i]:=L[i,N +1]/L[i,i]; 
 End; 
For i:=1 to N do 
 begin 
 For j:=i+1 to N do 
 begin 
 L[i,j]:=L[j,i]; 
 L[j,i]:=0; 
 End; 
 L[i,N +1]:=B1[i]; 
End; 
B1[N ]:=L[N ,N +1]/L[N ,N ]; 
For i:=N -1 downto 1 do 
 begin 
 For j:=i+1 to N do 
 L[i,N +1]:=L[i,N +1]-L[i,j]*B1[j]; 
 B1[i]:=L[i,N +1]/L[i,i]; 
 End; 
End; 
begin 
N:=3; 
writeln('dannaya SLAU');
vivod_matr(A,N); 
writeln('metod Holetckogo'); 
holet(A,B,N); 
vivod_vectr (B, N); 
End.