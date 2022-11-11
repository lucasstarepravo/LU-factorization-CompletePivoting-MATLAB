function [b] = lt_solve(A,b)
b([P 1:N]) = b([1:N P]); % Permuting b vector according to permutations on A
n = length(A);
A = tril(A,-1) + eye(n); % Creating lower triangular matrix from A matrix
for i = 2:n
    b(i) = b(i) - A(i,1:i-1)*b(1:i-1); % Solving lower triangular
end