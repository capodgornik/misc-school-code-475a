%{
September 2019
Math 475a
Explanation: My results show that the smallest integer number that is not represented 
  in single precision floating point format is 16,777,217. Furthermore, if one tries 
  to convert the double “16,777,217” into a single, then the result is “16,777,216”, 
  which is the largest integer number that is represented in single precision floating 
  point format. However, adding one to 16,777,217 and then converting it to a single 
  yields a value of 16,777,218, which is the same value as one gets by adding one to 
  16,777,217 without converting to a single.
%}

a = 1;
b = 0;
difference = 1;
n = 0;
 
while difference == 1 && n < 1000000000
    difference = single(a) - single(b);
    if difference ~= 1
        w = ['k = ', num2str(a)];
        x = ['k+1 = ', num2str(a+1)];
        y = ['single(k) = ', num2str(single(a))];
        z = ['single(k+1) = ', num2str(single(a+1))];
        disp(w);
        disp(x);
        disp(y);
        disp(z);
        break;
    end
    a = a + 1;
    b = b + 1;
    n = n + 1;
end

if n >= 1000000000
    x = ['Method failed after ', num2str(n), ' iterations.'];
    disp(x);
end

%{
Output:

k = 16777217
k+1 = 16777218
single(k) = 16777216
single(k+1) = 16777218
%}
