Uses Crt;
 Type
   vector = array[1..3] of real;
   matrix = array[1..3,1..3] of real;
 Const
   n:integer=3;
   e:real=0.001;
Var
   m,i,j,k,max:integer;  sum:array [1..3] of real;
   sum1,sum2:real;
   a:matrix;
   b,beta,x_curr,x_prev,x_tmp:vector;


 BEGIN

   a[1,1]:=4.07;  a[1,2]:=3.79;   a[1,3]:=3.37;  b[1]:=40.77;
   a[2,1]:=2.84;  a[2,2]:=2.44;   a[2,3]:=1.95;  b[2]:=27.68;
   a[3,1]:=4.99;  a[3,2]:=4.50;   a[3,3]:=3.97;  b[3]:=49.37;


   sum1:=0; sum2:=0; k:=0;

  for i:=1 to n do
    beta[i]:=b[i]/a[i,i];

  Repeat
    inc(k);
     if k <> 1 then
       for i:=1 to n do
         x_prev[i]:=x_tmp[i];
    for i:=1 to n do
      begin
         sum1:=0;
        for j:=1 to i-1 do
          sum1:=sum1 + a[i,j] * x_prev[j];
          sum2:=0;
        for j:=i+1 to n do
                      sum2:=(sum2 + a[i,j] * x_prev[j])/10;
          x_curr[i]:=(b[i] - sum1 - sum2)/a[i,i];
      end;
    for i:=1 to n do
      x_tmp[i]:=x_curr[i];
      max:=1;
    for i:=1 to n-1 do
      if abs(x_curr[max]-x_prev[max]) < abs(x_curr[i+1]-x_prev[i+1]) then
         max:=i+1;
  Until  abs(x_curr[max]-x_prev[max]) < e;
    for i:=1 to n do
        writeln('x[',i,']=',x_curr[i]:2:3);
        writeln('Итог=',k);
END.