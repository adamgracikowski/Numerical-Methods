function T = generate3diag(x, y)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Generates a tridiagonal, symmetric and real matrix, which main diagonal
% contains respective elements of the x vector. Its subdiagonal as well as
% its supradiagonal contains respective elements of the y vector.
% INPUT:
%   x - vector containing elements on the main diagonal of the matrix.
%   y - vector containing elements on the subdiagonal of the matrix.
% Output:
%   T - tridiagonal matrix.

T = diag(y, -1) + diag(x) + diag(y, 1);

end % function