uses crt; 
type 
Tmatr=array[1..3,1..4]of real;
Tvector=array[1..3]of real;
const
A:tmatr= ((4.07,3.79,3.37,0),
 (2.84,2.44,1.95,0),
 (4.99,4.5,3.97,0)
 );
B:Tvector= (40.77,27.68,49.37);
N:integer = 3;
K:integer = 3;
Procedure vivod_vectr(B1:Tvector; N :integer);
var
j:integer;
begin
For j:=1 to N do writeln('x',j,'=',B1[j]:0,' ');
writeln;
End;

PROCEDURE SIMQ(Var Nn:Integer; Var Aa:Tmatr; Var Bb:TVector;Var Ks:Integer);
Label M1; 
Const Eps=1e-21; 
Var Max,U,V : Real; I,J,K1,L : Integer; 
Begin 

For I:=1 To Nn Do Aa[i,Nn+1]:=Bb[i]; 
For I:=1 To Nn Do 
 Begin 
 Max:=Abs(Aa[i,i]); K1:=I; 
 For L:=I+1 To Nn Do If (Abs(Aa[l,i])>Max) Then 
 writeln(L);
	 Begin 
	 Max:=Abs(Aa[l,i]); K1:=L;End; 
	 If(Max<Eps) Then Begin Ks:=1; Goto M1; 
	 End Else Ks:=0; 
	 If K1<>I Then 
	 For J:=I To Nn+1 Do 
		 Begin U:=Aa[i,j]; Aa[i,j]:=Aa[k1,j]; Aa[k1,j]:=U; End; 
			 V:=Aa[i,i]; 
			 For J:=I To Nn+1 Do 
			 	Aa[i,j]:=Aa[i,j]/V; 
				 For L:=i+1 To Nn Do Begin 
				 	V:=Aa[l,i]; 
				 	For J:=I+1 To Nn+1 Do 
				 		Aa[l,j]:=Aa[l,j]-Aa[i,j]*V;
				 	End; 
				 	End; 
				 Bb[nn]:=Aa[Nn,Nn+1]; 
				 For I:=Nn-1 Downto 1 Do 
				 	Begin Bb[i]:=Aa[i,nn+1]; 
				 	For J:=I+1 To Nn Do 
				 		Bb[i]:=Bb[i]-Aa[i,j]*Bb[j]; 
				 	End; 	
				 	
				 M1:End;
				 
Begin
SIMQ(N,A,B, K);
writeln('Gauss');
 vivod_vectr(B, 3);
End.