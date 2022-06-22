%{
October 2019
Math 475a
%}

A = [1 1 1 1 1 1; 1 2 3 4 5 6; 1 4 9 16 25 36; 
    1 8 27 64 125 216; 1 16 81 256 625 1296; 
    1 32 243 1024 3125 77760];
b = [ -9; -14; -14; 70; 826; 6166];
 
format short;
   
n = size(A);
L = eye(n);
P = eye(n);
U = A;
    
for col = 1:n-1
    max = abs(U(col,col));
    pivot = col;
    for k = col:n    
        if abs(U(k, col)) > max
            max = U(k, col);
            pivot = k;
        end   
    end
    temp = U(col, 1:n);
    U(col, 1:n) = U(pivot, 1:n);
    U(pivot, 1:n) = temp;
    temp2 = P(col, 1:n);
    P(col, 1:n) = P(pivot, 1:n);
    P(pivot, 1:n) = temp2;
    if col > 1
        temp3 = L(col, 1:col-1);
        L(col, 1:col-1) = L(pivot, 1:col-1);
        L(pivot, 1:col-1) = temp3; 
    end
    for row = col+1:n
        m = U(row,col)/U(col,col);
        L(row,col) = m;
        U(row, 1:n) = U(row, 1:n) - m*U(col, 1:n);
    end
end
 
b1 = P*b;
 
I = eye(n);
invL = zeros(n);
for row = 1:n
    for col = 1:n
        invL(row,col) = (I(row,col) - (L(row,1:row-1)*invL(1:row-1,col)))/L(row,row);
    end
end
 
transposeU = zeros(n);
for row = 1:n
    for col = 1:n
        transposeU(col, row) = U(row, col);
    end
end
 
I2 = eye(n);
invU = zeros(n);
for row = 1:n
    for col = 1:n
        invU(row,col) = (I2(row,col) - (transposeU(row,1:row-1)*invU(1:row-1,col)))/transposeU(row,row);
    end
end
 
newInvU = zeros(n);
for row = 1:n
    for col = 1:n
        newInvU(col, row) = invU(row, col);
    end
end
 
y = invL*b1;
 
x = newInvU*y;
 
disp('x:');
disp(x);
disp('Ax:');
disp(A*x);

%{
Output:

x:
   -3.0017
   -7.9914
    7.9829
  -10.9829
    4.9914
    0.0017

Ax:
   1.0e+03 *
   -0.0090
   -0.0140
   -0.0140
    0.0700
    0.8260
    6.1660
%}
