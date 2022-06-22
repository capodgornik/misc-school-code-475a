%{
November 2019
Math 475a
Explanation (Output3): The polynomial doesn’t converge to the 
  function on the whole interval, but it approximates the function 
  closely on [-2, 2].  
%}

n = 18; %I changed the value of n (number of interpolation points) here each time
x = linspace(-3, 3, n);
xx = linspace(-3, 3, 2025);
 
matrix = zeros(n);
fVector = zeros(n, 1);
 
for k = 1:n
   fVector(k) = f(x(k));
   for l = 1:n
       matrix(k,l) = (x(k))^(l-1);
   end
end
 
aVector = matrix\fVector;
 
plot(xx,f(xx),'b',xx,pn(aVector, xx, n),'r');
 
values = zeros(n,1);
 
for w = 1:n
   values(w) = pn(aVector, x(w), n); 
end
 
hold on;
plot(x,values,'ok');
hold off;
 
maxError = abs(pn(aVector, xx(1), n) - f(xx(1)));
for k = 2:length(xx)
    if abs(pn(aVector, xx(k), n)- f(xx(k))) > maxError
        maxError = abs(pn(aVector, xx(k), n)- f(xx(k)));
    end
end
 
disp(['Max Interpolation Error: ', num2str(maxError)]);
disp(['Number of Interpolation Points: ', num2str(n)]);

function myFunction = f(x)
    myFunction = sin(2*x); % <-Output1, Output2. Output3: 1./(1+x.^2)
end
 
function myFunction2 = pn(v, x, n)
    num = 0;
    for k = 1:n
        num = num + v(k)*(x).^(k-1);
    end
    myFunction2 = num;
end

%{
Output1 (for n = 7):
  Max Interpolation Error: 0.67633
  Number of Interpolation Points: 7
 
Output2 (for first interpolation error less than 10^(-5)):
  Max Interpolation Error: 2.2244e-06
  Number of Interpolation Points: 18

Output3:
  Max Interpolation Error: 1.8919
  Number of Interpolation Points: 19
%]
