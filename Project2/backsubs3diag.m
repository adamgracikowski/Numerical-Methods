function b = backsubs3diag(x, y, z, b, U)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Solves the linear system of equations Ax = b, where the matrix A is an
% upper-triangular matrix stored in vectors x, y, and z. The matrix A was
% created as a result of Householder reflections.
% INPUT:
%   x - vector containing elements on the main diagonal of the matrix.
%   y - vector containing elements on the supradiagonal of the matrix.
%       It has one element less than vector x.
%   z - vector containing elements on the diagonal above y.
%       It has two elements less than vector x.
%   b - right-hand side column vector
%   U - a 2 by n-1 matrix (where n is the size of the matrix A), which
%       contains non-zero elements of vectors used in Householder
%       reflections. Reflections are applied on vector b prior to
%       performing the backward substitution.
% Output:
%   b - solution to the considered system of equation

% size of the problem
n = length(x);

% applying householder reflections
for i = 1:n-1
    v = b(i:i+1); u = U(:,i);
    b(i:i+1) = v - 2*(u'*v)/(u'*u)*u;
end % for

% backward substitution
b(n) = b(n)/x(n);
b(n-1) = (b(n-1) - y(n-1)*b(n))/x(n-1);
for i = n-2:-1:1
    b(i) = (b(i) - y(i)*b(i+1) - z(i)*b(i+2))/x(i);
end % for

end % function