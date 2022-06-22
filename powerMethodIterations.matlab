%{
October 2019
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

function [v1, lambda1, k] = powerMethodIterations(A, x)
 
    format long;
 
    tol = 10^(-8);
    nMax = 50;
    lambdaOld= 0;
    k = 0;
 
    x = x/(x*transposeVector(x))^(1/2);
 
    while k < nMax
       k = k+1;
       xNew = A*transposeVector(x);
       lambdaNew = transposeVector(xNew)*transposeVector(x);
       if xNew == 0
           lambda1 = 0;
           v1 = x;
           disp('Found 0 eigenvalue');
           break;
       end
       xNew = xNew/(transposeVector(xNew)*xNew)^(1/2);
       if (abs(lambdaOld - lambdaNew) < tol)
           v1 = xNew;
           lambda1 = lambdaNew;
           disp('Eigenvector:');
           disp(v1);
           disp('Eigenvalue:');
           disp(lambda1);
           disp('Number of iterations:');
           disp(k);
           break;
       end
       lambdaOld = lambdaNew;
       x = transposeVector(xNew);
    end
 
    if k >= nMax
        disp('Error. Number of iterations exceeded 50.');
    end
 
end

%{
Output:

Eigenvector:
  -0.017238400800940
   0.095721231949443
   0.222909067824797
   0.367193932477381
   0.532271541325552
   0.722985098753844

Eigenvalue:
  18.878503169033134

Number of iterations:
    10
%}
