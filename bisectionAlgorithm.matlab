%{
September 2019
Math 475a
Explanation: According to the bisection algorithm, 
  f(x) = 3x – 27 + cos(x) = 0 when x = 3.0332. I used 0.001 to find 
  the new a and b because in question 1 of the homework that was the 
  difference between the x values used for plotting the graphs of 
  the function and its derivative.  
%}

f = @(x) 3^x - 27 + cos(x);
a = 2;
b = 4;
tol = 10^-6;
k = 1;
 
while k < 100
    p = (a+b)/2;
    if f(p) >= 10^-6
        w = ['f(x) = 0 when x = ', num2str(p)];
        disp(w);
        break
    end
    if f(p)*f(a) > 0
        a = p;
        b = b - 0.001;
    end
    b = p;
    a = a + 0.001;
    k = k + 1;
end
 
if k ==100
    x = ['Method failed after ', num2str(k), ' iterations.'];
    disp(x);
end

%{
Output:

f(x) = 0 when x = 3.0332
%}
