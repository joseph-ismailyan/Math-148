% Joseph Ismailyan, 1558715
%
% fun: function handle
% a,b: interval to check for a zero
% tol: max tolerance allowed for increment
% Nmax: max number of iterations
%
% z0: approximation of zero
% iter: number of iterations
% res: residue
% his: history of guesses

function [z0,iter,res,his] = secant_method(fun, a, b, tol,Nmax)
    z0 = 0;
    iter = 0;
    res = 0;
    his = [];
    
    q = (fun(b) - fun(a))/(b-a);
    his(1) = a;
    his(2) = b;
    i = 2;
    %Loop
    while (abs(his(i) - his(i-1)) > tol) && (i < Nmax)
        his(i + 1) = -fun(his(i))/q + his(i);
        %Increment
        i = i + 1;
    end
    %Set return values
    iter = i;
    z0 = his(i);
    res = abs(fun(z0) - 0);

