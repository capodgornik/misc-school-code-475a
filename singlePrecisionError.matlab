%{
September 2019
Math 475a
Explanation: My results show that the max relative error for the single 
  precision representation is 5.936e-08, the machine epsilon in single 
  precision is 1.1921e-07, and half of the machine epsilon in single precision 
  is 5.9605e-08. Thus, since the value of half the machine epsilon is closer 
  to the max relative error than the machine epsilon value is, my results 
  indicate that the number that seems to give an accurate upper bound on the
  relative error in single precision is half of the max epsilon. 
%}

p = randn(1,10000);
pStar = single(1);
 
for i = 1:length(p)
   pStar(i) = single(p(i));
end
 
errors = []*length(p);
absErrors = []*length(p);
relErrors = []*length(p);
 
for i = 1:length(p)
  errors(i) = pStar(i) - p(i);
  absErrors(i) = abs(pStar(i) - p(i));
  relErrors(i) = abs((pStar(i)-p(i))/(p(i)));
end
 
maxRelError = max(relErrors);
 
machEps = eps('single');
halfMachEps =machEps/2;
 
x = ['Max Relative Error: ',num2str(maxRelError)]; 
y = ['Machine Epsilon: ', num2str(machEps)];
z = ['Half of Machine Epsilon: ', num2str(halfMachEps)];
 
disp(x);
disp(y);
disp(z);

%{
Output:

Max Relative Error: 5.936e-08
Machine Epsilon: 1.1921e-07
Half of Machine Epsilon: 5.9605e-08
%}
