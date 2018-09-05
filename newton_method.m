% Joseph Ismailyan, 1558715
%
% fun: function
% dfun: derivative of function
% x0: initial guess
% tol: tolerance
% Nmax: max number of iterations
%
% z0: final guess
% iter: number of iterations
% res: residue
% his: history of guesses

function [z0,iter,res,his] = newton_method(fun,dfun,x0,tol,Nmax)
    %disp(fun);
    %disp(dfun);
    iter = 0;
    x_guess = x0;
    his = {};
    while (abs(fun(x_guess)) > tol) && iter < Nmax
        his = [his,x_guess];
        %fprintf("x%d = %f\n",iter, x_guess);
        x_guess = x_guess - fun(x_guess)/dfun(x_guess);
        iter = iter + 1;
    end
    
    if iter == Nmax 
        % fprintf('Max number of iterations reached');
    end
    
    z0 = x_guess;
    res = abs(fun(x_guess));
  
  