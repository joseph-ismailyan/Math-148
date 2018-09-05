function [r] = bisect(f,a,b,tol)
    disp(f);
    if abs(f(a)) < tol
        [r] = a;  
    elseif abs(f(b)) < tol
         [r] = b;     
    elseif f(a)*f(b) > 0 
        disp('no roots in given interval');
        return;
    else 
        c=0;
        i=0;
        while abs(f(a)) > tol
            if i > 50
                fprintf('too many iterations, exiting...');
                return;
            end
            c = (b+a)/2;
            fprintf('iteration: %d, a= %.3f, b= %.3f, c= %.3f\n', i, a, b, c);
            i = i+1;
            if f(a)*f(c) > 0
                a=c;
            else
                b=c;
            end
            [r] = a;
            fprintf('a=%.3f',a);
        end
    end
        
        %{
        while f(a)*f(b) < 0 && (f(a) > tol || f(b) > tol)
            if i > 50
                fprintf('too many iterations, exiting...');
                return;
            end
            fprintf('iteration: %d, a= %f, b= %f\n', i, a, b);
            i = i+1;
            
            if f(a)*f(b/2) < 0
                b = b/2;
            else 
                a = (a+b)/2;
            end
           
        end
        if abs(f(a)) < tol
            [r] = a;  
        else
            [r] = b;  
        end
    end
        %}
    
          
         
     
        

