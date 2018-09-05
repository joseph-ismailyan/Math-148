%Joseph Ismailyan, 1558715
%
% e = [e(1) ... e(n-1)]
% a = [a(1) ... a(n)] (diagonal vector)
% c = [c(1) ... c(n-1)]
% b = [b(1) ... b(n)] (RHS)
%
% x: solution to the linear system (column vector)
%
% To test: Use values
%
% a = [2.04, 2.04, 2.04, 2.04];
% e = [-1, -1, -1];
% c = [-1, -1, -1];
% b = [40.8, 0.8, 0.8, 200.08];
%
% Result should be: 
% x =  [65.8464, 93.5267, 124.1480, 158.9353]
%

function x = tridiagsolver(e,a,c,b)

[~,n] = size(a);
cp = [];
bp = [];
x = [];
e = [0 e];

cp(1) = c(1)/a(1);
bp(1) = b(1)/a(1);

for i = 2:n-1
    cp(i) = c(i)/(a(i)-e(i)*cp(i-1));
end

for i = 2:n
    bp(i) = (b(i)-e(i)*bp(i-1))/(a(i)-e(i)*cp(i-1));
end

x = bp;

for i = n-1:-1:1

    x(i) = bp(i)-cp(i)*x(i+1); 
end

end

