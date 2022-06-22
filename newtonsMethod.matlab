%{
September 2019
Math 475a
Explanation: After 6 iterations, Newton’s Method found the root 
  of f(x) = 3x - 27 + cos(x) to be x = 3.0329. This is almost the  
  same number as was found in question 1 (using the bisection 
  algorithm) and it took 61 fewer iterations to find. The difference 
  between the value found in question 1 and the value found in 
  question 2 (this code) is 3.0332 – 3.0329 = 0.0003. 
%}

format long;

f = @(x) 3^x - 27 + cos(x);
fPrime = @(x) log(3)*3^x -sin(x);
 
tol = 10^(-13);
k = 1;
pPrev = 3.7; 
 
while k < 100
    pNext = pPrev - (f(pPrev)/fPrime(pPrev));
    if abs(pNext - pPrev) < tol
        w = ['f(x) = 0 when x = ', num2str(pNext)];
        x = ['Number of iterations: ', num2str(k)];
        disp(w);
        disp(x);
        break
    end
    pPrev = pNext;
    k = k + 1;
end
 
if k == 100
    x = ['Method failed after ', num2str(k), ' iterations.'];
    disp(x);
end

%{
Output:

f(x) = 0 when x = 3.0329
Number of iterations: 6
%}
