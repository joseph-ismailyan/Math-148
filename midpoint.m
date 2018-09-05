%Joseph Ismailyan, 1558715
%
% fun: function handle representing f(x)
% a, b: endpoints of the interval of integration
% n:  number of evenly-spaced points in [a,b] (including endpoints)
%
% I: numerical approximation of the integral (1).

function [I] = midpoint(fun, a, b, n)

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

% calculate f(x_n)*x and sum with previous nodes
for i = 1:index-1
   toSum = toSum + f(x(i))*dx;
   %fprintf("run %d, value = %f\n", i, toSum);
end

[I] = toSum;


end

