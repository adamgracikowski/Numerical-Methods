function b = gepp3diag(y, z, d, b, P, K)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Solves the linear system of equations Ax = b for the case when A was 
% originally a tridiagonal matrix, on which lu3diag function was invoked.
% INPUT:
%   y - main diagonal of the tridiagonal matrix.
%   z - supradiagonal of the tridiagonal matrix.
%   d - additional diagonal with non-zero elements (the one above z).
%   b - right-hand side column vector.
%   P - vector of 1s and 0s (returned by lu3diag function). 1 means that 
%       proper rows were swapped and 0 means that there was no swapping.
%   K - vector of coefficients evaluated during gaussian elimination
%       (returned by lu3diag function).
% OUTPUT:
%   b - solution to the considered system of equation.

% size of the problem:
n = length(b);

for i = 1:n-2
    % swapping rows:
    if P(i)
        [b(i), b(i+1)] = deal(b(i+1), b(i));
    end % if
    % gaussian elimination:
    b(i+1) = b(i+1) - b(i)*K(i);
end % for

% performing the last iteration of the loop:
b(n) = b(n) - b(n-1)*K(n-1);

% backward substitution:
b(n) = b(n)/y(n);
b(n-1) = (b(n-1) - b(n)*z(n-1))/y(n-1);

for i = n-2:-1:1
    b(i) = b(i) - b(i+1)*z(i) - b(i+2)*d(i);
    b(i) = b(i)/y(i);
end % for

end % function