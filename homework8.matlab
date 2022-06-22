%{
December 2019
Math 475a
%}

grid = linspace(-pi, pi, 1001);
 
res10 = r(10, ck(10), b(10,grid));
res20 = r(20, ck(20), b(20, grid));
res40 = r(40, ck(40), b(40,grid));
 
plot(grid, real(res10), grid, real(res20), grid, real(res40), grid, ones(1001), grid, zeros(1001));
 
function createRes = r(m, coefficient, func)
    createRes = zeros(1, 1001);
    for k = 1:2*m+1
       for l = 1:1001
           createRes(l) = createRes(l) + coefficient(k)*func(k,l);
       end
    end   
end
 
function basisFunc = b(m, grid)
    basisFunc = zeros(2*m+1, 1001);
    l1 = 1;
    l2 = 1;
    for k = -m:m
        for g = 1:1001
            basisFunc(l1, l2) = (cos(k*grid(g)) + i*sin(k*grid(g)));
            l2 = l2 + 1;
        end
        l1 = l1 + 1;
        l2 = 1;
    end
end
 
function myFunction = ck(m)
    myFunction = zeros(1, 2*m+1);
    l = 1;
    for k = -m:m
        if k ~= 0
            myFunction(l) = sin(pi*k/2)/k/pi;
        end
        if k == 0
            myFunction(l) = 1/2;
        end
        l = l+1;
    end
end
