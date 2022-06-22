%{
November 2019
Math 475a
%}

function [v1, lambda1, k] = inversePowerMethod(A, x)
    format long;
    
    x = x/(transposeVector(x)*x)^(1/2);
    tol = 10^(-8); 
    nMax = 50;
    lambdaOld = 0;
    mu= 4.0;
    B = A-(mu*eye(6));
    k = 0;
    [P,L,U] = LUwith(B);
 
    while k < nMax
        k = k + 1;
        %solveAx was in my homework 4 code
        y = solveAx(L, P*x);
        xNew = solveAx(U, y);
        lambdaNew = transposeVector(xNew)*x;
        xNew = xNew/(transposeVector(xNew)*xNew)^(1/2);
        error = B*xNew - (1/lambdaNew)*xNew;
        lengthError = (transposeVector(error)*error)^(1/2);
        if lengthError < tol
            v = xNew;
            lambda = 1/lambdaNew + mu;
            disp('Eigenvector:');
            disp(v);
            disp('Eigenvalue:');
            disp(lambda);
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
  -0.111001684459402
  -0.091311109851009
  -0.036526074602872
   0.915293286959732
  -0.301403929491240
  -0.222262509822838

Eigenvalue:
   4.122147029652130

Number of iterations:
     9
%}
