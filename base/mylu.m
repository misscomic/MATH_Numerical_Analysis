function [L,U] = mylu(A)
% function [L,U] = mylu(A)
%
% Performs standard LU factorization of A
% Does not use partial pivoting or row or
% column swaps
%
% The algorithm is based on the recursive
% algorithm in mylurec.m
[m,n] = size(A);
U = A;
L = eye(n);
for k = 1:n-1
    L(k+1:n,k) = U(k+1:n,k) / U(k,k);
    U(k+1:n,k) = 0;
    U(k+1:n,k+1:n) = U(k+1:n,k+1:n) - L(k+1:n,k)*U(k,k+1:n);
end

end

