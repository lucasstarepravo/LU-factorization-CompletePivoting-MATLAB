function [b] = ut_solve(A, b)
n = length(A);                          
A = triu(A);                            % Selecting upper triangular values of A
b(n) = b(n)/A(n,n);                     % Computing last entry
for i = n-1:-1:1
    b(i) = b(i) - A(i,i+1:n)*b(i+1:n);  % Solving upper triangular
    b(i) = b(i)/A(i,i);                 % Dividing by diagonal entry
end
b([1:N Q]) = b([Q 1:N]);                % Readjusting column pivoting
end