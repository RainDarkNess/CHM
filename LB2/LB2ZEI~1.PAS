const n = 3;
const eps = 9;
type TMatr = array[1..n,1..n] of real;
type TVector = array[1..n] of real;
procedure Zeidel(var a:TMatr;var b:TVector;n:integer; step:integer);
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
Begin
end.