%Joseph Ismailyan, 1558715
%
% fun: function handle representing f(x)
% a, b: endpoints of the interval of integration
% n:  number of evenly-spaced points in [a,b] (including endpoints)
% em: array with absolute errors of midpoint function
% et: array with absolute errors of trapezoidal function
% es: array with absolute errors of Simpson function
%
% I: numerical approximation of the integral (1).

function [em, et, es] =  testintegration()

f = @(x) (1/(1+x.^2))*cos((3/2)*exp(-x^2))-((x.^3)/30);
n = 100;
a = -3;
b = 1;
I_ref =  1.6851344770476;

em = [];
x_midpoint = [];
et = [];
x_trapezoidal = [];
es = [];
x_Simpson = [];


for i=2:n
    % calculate midpoint
    x_midpoint(i-1) = midpoint(f,a,b,i);
    em(i-1) = abs(I_ref - x_midpoint(i-1));
    
    % calculate trapezoidal
    x_trapezoidal(i-1) = trapezoidal(f,a,b,i);
    et(i-1) = abs(I_ref - x_trapezoidal(i-1));
    
    % calculate Simpson
    x_Simpson(i-1) = Simpson(f,a,b,i);
    es(i-1) = abs(I_ref - x_Simpson(i-1));
    
    %print what % has been completed
    %fprintf('%.2f%%\n', abs(i/n)*100);

end

x = linspace(a,b,n-1);
% graphs
fplot(f,[a,b])
title('Graph of function');
figure()
loglog(x, em, 'g', x, et, 'b', x, es, 'r');
title('Error of midpoint vs trapezoidal vs Simpson methods');
lgd = legend('midpoint','trapezoidal','Simpson');
lgd.Location = 'southwest';

end

