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
%   T - tridiagonal matrix

x = randi([imin, imax], 1, n);
y = randi([imin, imax], 1, n-1);
T = generate3diag(x, y);

end % function