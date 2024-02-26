uses crt; 
const n = 3;


type Tmatr = array[1..n,1..n] of real;
type TVector=array[1..n] of real;

Procedure vivod_vectr(B1:Tvector; N :integer);
var
j:integer;
begin
For j:=1 to N do writeln('x',j,'=',B1[j]:0,' ');
writeln;
End;



Procedure gauss (n: Integer;
                 a: Tmatr;
                 b: TVector);
Var
        x: TVector;
        k,w,e,l,i,j :integer;
        c,aux,m,soma :real;
Begin
        w:=1;  {w is a variable for fixed column}
        for k:=1 to n do  {k is the number of iterations}
        begin
                e:=k; {e is the adress of the pivot}
                c:=a[k,w];
                if k<n
                then
                begin
                        for i:=1 to n do {searching for the pivot}
                        begin
                                if k+1 <= n
                                then
                                begin
                                        if abs(a[i+1,w]) > c
                                        then
                                        begin
                                                c:=a[k+i,w];
                                                e:=k+i;
                                        end;
                                end;
                        end;
                        for j:=1 to n do {changing lines}
                        begin
                                aux:=a[k,j];
                                a[k,j]:=a[e,j];
                                a[e,j]:=aux;
                        end;
                        if c <> 0
                        then
                        begin
                                for i:=1 to n do {gaussian elimination}
                                begin
                                        if i > k then
                                        begin
                                                 m:=a[i,w]/a[k,w];
                                                 for j:=1 to n do
                                                 begin
                                                        a[i,j]:=a[i,j]-m*a[k,j];
                                                 end;
                                                 b[i]:=b[i]-m*b[k];
                                        end;
                                end;
                        end;
                end;
                w:=w+1;
        end;
        if a[n,n] <> 0 {calculating x}
        then
        begin
                x[n]:=b[n]/a[n,n];
                for l:=n-1 downto 1 do
                begin
                        soma:=0;
                        for j:=n downto l+1 do
                        begin
                                soma:=soma+x[j]*a[l,j];
                        end;
                        x[l]:=(b[l]-soma)/a[l,l];
                end;
        end
        else
        begin
                writeln('Error');
        end;
end;

PROCEDURE SIMQ(Var Nn:Integer; Var Aa:Tmatr; Var Bb:TVector;Var Ks:Integer);
Const Eps=1e-21; 
Begin 
   Aa[1,1]:=4.07;  Aa[1,2]:=3.79;   Aa[1,3]:=3.37;  Bb[1]:=40.77;
   Aa[2,1]:=2.84;  Aa[2,2]:=2.44;   Aa[2,3]:=1.95;  Bb[2]:=27.68;
   Aa[3,1]:=4.99;  Aa[3,2]:=4.50;   Aa[3,3]:=3.97;  Bb[3]:=49.37;
   
   gauss(n, Aa, Bb);

End;
Begin

end.