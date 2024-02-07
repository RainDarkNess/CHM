const n = 3;
type Tmatr = array[1..n,1..n] of real;
type TVector=array[1..n] of real;
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
				 End.