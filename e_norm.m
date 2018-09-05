function y = e_norm(varargin)
    S = sum([varargin{:}].^2);
y = sqrt(S);