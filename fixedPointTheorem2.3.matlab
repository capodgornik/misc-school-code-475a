%{
September 2019
Math 475a
Explanation: First, according to my results, g(x) = 4 + 0.5*cos(x) + 1/ln(x) 
is continuous on the interval [4,5]. Furthermore, the interval is mapped onto 
itself since the y values are all between 4 and 5 on the interval for all x 
values in [4,5]. Thus, by Theorem 2.3, the function has at least one fixed 
point in [4,5]. Second, g’(x) exists on the interval (4,5) since there are no 
discontinuities, sharp corners, or vertical sections on the graph of g(x) from 
(4,5) and abs(g’(x)) < k <= 1 because the y values of g’(x) are all less than 1 
in the interval (4,5). Therefore, by Theorem 2.3, there exists only one fixed point. 
%}

xx = 4:0.001:5;

ff = []*length(xx);
g = @(x) 4 + 0.5 * cos(x) + 1/log(x);
 
ffPrime = []*length(xx);
gPrime = @(x) -1/(x*log(x)^2) - 0.5*sin(x);
 
for i = 1:length(xx)
   ff(i) = g(xx(i)); 
   ffPrime(i) = gPrime(xx(i)); 
end
 
plot(xx,ff);
plot(xx,ffPrime);
