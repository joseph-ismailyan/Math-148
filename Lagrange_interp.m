%Joseph Ismailyan, 1558715
%
% xi: vector  of  interpolation  nodes
% yi: vector  of  data  points  at  interpolation  nodes
% x: vector  of  points  at  which  we  evaluate  the  polynomial  interpolant
%
% y : polynomial  interpolant  evaluated  at x

function  [y] = Lagrange_interp(xi,yi,x)
%{
f = @(x) exp(-x^2);
disp(f);

% fill xi array
xi = [-1,0,1];
% point at which to test interpolating function
x = -0.9;


% fill yi array 
for i=1:length(xi)
    yi(i) = f(xi(i));
    fprintf("x=%d, y=%f\n",xi(i), yi(i));
end
disp(newline);

%}


li = [];
toSum = [];
liPart = 1;


% come up with li values
for i=2:length(xi)+1
    % keep track of current index to process all segments with same xi
    currentLI = i-1;
    proc = 0;
  for j=1:length(xi)+1
      
      % this prevents the function from going out of bounds
      if proc == length(xi)-1
          break;
      end
     % process individual segements of li
     if j ~= currentLI
        newSeg = (x - xi(j))/(xi(currentLI) - xi(j));
        % multiply each new segment by previous segment
        liPart = liPart * newSeg;
        proc = proc + 1;
     else
         newSeg = 1;
     end
     %fprintf("currentLI= %d, j=%d, proc = %d, newSeg = %f\n", currentLI, j, proc, newSeg);
     %fprintf("liPart = %f\n", liPart);
     
  end
  % assign completed li to respective li(i)
  li(currentLI) = liPart;
  % reinit liPart to 1 to clear previous li
  %fprintf("\t\t\treassigning liPart\n");
  liPart = 1;
 
end
% multiply li with respective yi and put into array for later processing
for i=1:length(yi)
    toSum(i) = yi(i)*li(i);
    %fprintf("li(%d)= %f\n", i,li(i));
end

y = sum(toSum);
%fprintf("true value = %f", f(x));
%fprintf("\n\nerror = %f", abs(f(x)-y)/f(x)*100)

end

