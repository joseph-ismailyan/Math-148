%Joseph Ismailyan, 1558715
%
% fun: function handle representing f(x)
% a, b: endpoints of the interval of integration
% n:  number of evenly-spaced points in [a,b] (including endpoints)
%
% I: numerical approximation of the integral (1).

function [I] = Simpson(fun, a, b, n)

f = fun;
% x will contain all our x_n values
x = [];
% integer temporarily stores the next x_n value
integer = a;
% width is (b-a)/n
dx = (b-a)/n;
% the size of index is how many x_n values we'll have
index = 1;
% toSum will contain all f(x_n)dx
toSum = 0;
% need an indexed array with all x_n values
while integer <= b
    %fprintf("while loop entered\n");
    x(index) = integer;
    integer = integer + dx;
    index = index + 1;
end
%fprintf("x =  %d\n\n", length(x)-1);
% calculate f(x_n)*x and sum with previous nodes
% doesn't do x_1 and x_n
x_1 = f(a);
%fprintf("x_1= %f\n", x_1);
x_n = f(b);

for i = 2:index-1
    if mod(i,2) == 0
        toSum = toSum + 4*f(x(i));
        %fprintf("i= %d, toSum = %f\t", i, toSum);
        %fprintf("multiplying by 4\n");
    else
        toSum = toSum + 2*f(x(i));
        %fprintf("i= %d, toSum = %f\t", i, toSum);
        %fprintf("multiplying by 2\n");
    end
end
%fprintf("x_%d= %f\n",n , x_n);
toSum = (dx/3)*(x_1 + toSum + x_n);
 %fprintf("index =  %d", index);
[I] = toSum;


end
