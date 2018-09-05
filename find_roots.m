function [r1,r2] = find_roots(a,b,c)
    d = b.^2-4*a*c;
    r1 = (-b + sqrt(d))/(2*a);
    r2 = (-b - sqrt(d))/(2*a);
end
