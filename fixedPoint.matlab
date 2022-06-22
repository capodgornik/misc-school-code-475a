%{
September 2019
Math 475a
Explanation: The fixed point for g(x) = 4 + 0.5cos(x) + 1/ln(x) is 4.5987, 
  therefore g(4.5987) = 4.5987. I choose a value of 4.5 for my initial guess 
  because I looked at the graph of g(x) and thought that g(4.5) looked 
  close enough to 4.5 to be adequate. 
%}

g = @(x) 4 + 0.5 * cos(x) + 1/log(x);
tol = 10^-5;
pPrev = 4.5;
k = 1;
 
while k < 1000
    pNext = g(pPrev);
    if abs(pNext - pPrev) < tol
        w = ['p* = ', num2str(pNext)];
        disp(w);
        break;
    end
    k = k + 1;
    pPrev = pNext;
end
 
if k == 1000
     x = ['Method failed after ', num2str(k), ' iterations.'];
    disp(x);
end

%{
Output:

p* = 4.5987
%}
