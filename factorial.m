function y = factorial(x)
if (x == 0)
        y = 1;
else
    for (i = 1:x-1)
        x = x*i;
    end
 y=x; 
end
end