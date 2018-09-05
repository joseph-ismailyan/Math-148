%Joseph Ismailyan, 1558715
%
% xi: vector  of  interpolation  nodes
% yi: vector  of  data  points  at  interpolation  nodes
% x: vector  of  points  at  which  we  evaluate  the  polynomial  interpolant
%
% y : polynomial  interpolant  evaluated  at x

function  [y] = Lagrange_interp_new()

f = @(x) exp(-x^2);

% fill xi array
xi = [-1,0,1];
% point at which to test interpolating function
x = -0.9;

li = [];
toSum = [];
liPart = 1;


% fill yi array
% remove for final submission
for i=1:length(xi)
    yi(i) = f(xi(i));
end
disp(newline);

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
     
  end
  % assign completed li to respective li(i)
  li(currentLI) = liPart;
  % reinit liPart to 1 to clear previous li
  liPart = 1;
 
end
% multiply li with respective yi and put into array for later processing
for i=1:length(yi)
    toSum(i) = yi(i)*li(i);
end

y = sum(toSum);
disp(f(x));
disp(y);
disp(polyval(polyfit(xi,yi,length(xi)-1),x));

fprintf("error = %f", abs(f(x)-y)/f(x)*100)

end

