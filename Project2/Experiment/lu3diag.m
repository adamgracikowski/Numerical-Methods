function [y, z, d, P, K] = lu3diag(x, y, z)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Performs LU decompisition on a tridiagonal matrix 
% stored in vectores x, y and z.
% INPUT:
%   x - subdiagonal of the tridiagonal matrix.
%   y - main diagonal of the tridiagonal matrix.
%   z - supradiagonal of the tridiagonal matrix.
% OUTPUT:
%   y - main diagonal after GEPP.
%   z - supradiagonal after GEPP.
%   d - additional diagonal with non-zero elements (the one above z).
%   P - vector of 1s and 0s. 1 means that proper rows were swapped 
%       and 0 means that there was no swapping.
%   K - vector of coefficients evaluated during gaussian elimination.

% size of the problem:
n = length(y);

% memory prealocation:
P = zeros(n-2, 1);
K = zeros(n-1, 1);
d = zeros(n-2, 1);

for i = 1:n-2
    % swapping rows:
    P(i) = abs(y(i)) < abs(x(i));
    if P(i)
        [y(i), x(i)] = deal(x(i), y(i));
        [z(i), y(i+1)] = deal(y(i+1), z(i));
        [d(i), z(i+1)] = deal(z(i+1), d(i));
        k = x(i)/y(i);
        z(i+1) = -d(i)*k;
    end % if

    % evaluating coefficients:
    k = x(i)/y(i); K(i) = k;
    y(i+1) = y(i+1) - z(i)*k;
end % for;

% performing the last iteration of the loop:
k = x(n-1)/y(n-1); K(n-1) = k;
y(n) = y(n) - z(n-1)*k;

end % function