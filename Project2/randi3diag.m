function T = randi3diag(n, imin, imax)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Generates a tridiagonal, symmetric and real matrix, which main diagonal,
% as well as supradiagonal and subdiagonal contains random integers from
% the interval [imin, imax].
% INPUT:
%   n    - size of the tridiagonal matrix.
%   imin - left verge of the interval, from which elements of the matrix
%          are randomly chosen.
%   imax - right verge of the interval, from which elements of the matrix
%          are randomly chosen.
% Output:
%   T - tridiagonal matrix.

% generating diagonals:
x = randi([imin, imax], 1, n);
y = randi([imin, imax], 1, n-1);
while all(x(1:end-1) == y)
    x = randi([imin, imax], 1, n);
    y = randi([imin, imax], 1, n-1);
end % while

T = generate3diag(x, y);

end % function