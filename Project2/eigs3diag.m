function T = eigs3diag(eigs)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% This function generates a tridiagonal, symmetric and real matrix T, which
% eigenvalues are equal to respective elements of the vector eigs.
% The matrix T is generated using Givens rotation matrices.
% INPUT:
%   eigs - vector of eigenvalues
% OUTPUT:
%   T - tridiagonal, symmetric and real matrix which eigenvalues are
%       specified by eigs. The size of the matrix is equal to the length 
%       of the vector eigs.

n = length(eigs);

% starting with the diagonal matrix 
T = diag(eigs);

for i = 1:2:n-1
    % the angle theta is randomly chosen from the interval (0, pi)
    G = givens(i, n, rand * pi);
    % applying Givens rotation
    T = G*T*G';
end % for

function G = givens(i, n, theta)
    % generates a Givens rotation matrix
    G = eye(n);
    c = cos(theta);
    s = sin(theta);
    G(i:i+1, i:i+1) = [c -s; s c];
end

end % function