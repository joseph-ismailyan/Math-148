function C = matrix_mult(A,B)
    [n,m] = size(A);
    [n,p] = size(B);
    
C = zeros(n,p);

    for i=1:n
        for j=1:p
            sum = 0;
            for k=1:m
                sum = sum + A(i,k) * B(k,j);
            end
             C(i,j) = sum;
        end
    end

end