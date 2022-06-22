%{
November 2019
Math 475a
%}

function [newV] = transposeVector(v)
    
    [r, c] = size(v);
    newV = zeros(c,r);
    for row = 1:r
        for col = 1:c
            newV(col,row) = v(row,col);
        end
    end
end

function [v1, lambda1, k] = inverseIteration(A, x)
    format long;
 
    x = x/(transposeVector(x)*x)^(1/2);
    tol = 10^(-8); 
    nMax = 50;
    lambdaOld = 0;
    mu= 3.7;
    k = 0;
    B = inv(A-mu*eye(6));
 
    while k < nMax
       k = k + 1;
       xNew = B*x;
       lambdaNew = transposeVector(xNew)*x;
       xNew = xNew/(transposeVector(xNew)*xNew)^(1/2);
       error = B*xNew - lambdaNew*xNew;
       lengthError = (transposeVector(error)*error)^(1/2);
       if lengthError < tol
           v1 = xNew;
           lambda1 = 1/lambdaNew + mu;
           disp('Eigenvector:');
           disp(v1);
           disp('Eigenvalue:');
           disp(lambda1);
           disp('Number of iterations:');
           disp(k);
           break;
       end
       x = xNew;
       lambdaOld = lambdaNew;
    end
    
    if k >= 50
        disp('Error. Did not converge in 50 iterations');
    end    
end

%{
Output:

Eigenvector:
  -0.111001684650102
  -0.091311110096080
  -0.036526073583634
   0.915293286830723
  -0.301403929946218
  -0.222262509708704

Eigenvalue:
   4.122147029652130

Number of iterations:
    33
%}
