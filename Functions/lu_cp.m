function [A, P, Q] = lu_cp(A)
n = length(A); P = 1:n; Q = 1:n;
for k = 1:n-1
    [max_val, max_index_r] = max(abs(A(k:n,k:n)));   % Gathering rows of max indexes w.r.t. k
    [~, max_index_c] = max(max_val);                 % Finding max column index
    max_index_r = max_index_r(max_index_c);          % Finding max row index
    max_index_r = max_index_r + k - 1;               % Globalizing row index
    max_index_c = max_index_c + k - 1;               % Globalizing column index
    A([k max_index_r],:) = A([max_index_r k],:);     % Permuting row
    A(:,[k max_index_c]) = A(:,[max_index_c k]);     % Permuting column
    P([k max_index_r]) = P([max_index_r k]);         % Permuting row vector
    Q([k max_index_c]) = Q([max_index_c k]);         % Permuting column vector
    gauss_w = A(k+1:n,k)./A(k,k);                    % Computing GW 
    A(k+1:n,k:n) = A(k+1:n,k:n) - gauss_w.*A(k,k:n); % Gaussian elimination
    A(k+1:n,k) = gauss_w';                           % Substituting GW in L part of A matrix
end
end