%{
November 2019
Math 475a
%}

x = pi/8;
 
lNum2 = 2^(1/2)*(x+pi/2)*(x)*(x-pi/4)*(x-pi/2);
lNum3 = (x + pi/2)*(x + pi/4)*(x - pi/4)*(x - pi/2);
lNum4 = 2^(1/2)*(x + pi/2)*(x + pi/4)*(x)*(x - pi/2);
 
lDenom2 = 2*(-pi/4 + pi/2)*(-pi/4)*(-pi/4 -pi/4)*(-pi/4-pi/2);
lDenom3 = (pi/2)*(pi/4)*(-pi/4)*(-pi/2);
lDenom4 = 2*(pi/4 + pi/2)*(pi/4 + pi/4)*(pi/4)*(pi/4-pi/2);
 
pn = (lNum2/lDenom2) + (lNum3/lDenom3) + (lNum4/lDenom4);
y = ['Pn(pi/8) = ', num2str(pn)];
disp(y);
 
error = pn - cos(pi/8);
z = ['Pn(pi/8) - cos(pi/8) = ', num2str(error)];
disp(z);

%{
Output:

Pn(pi/8) = 0.9241
Pn(pi/8) - cos(pi/8) = 0.00021634
%}
