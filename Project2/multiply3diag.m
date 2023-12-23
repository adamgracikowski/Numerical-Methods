function u = multiply3diag(x, y, v)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Multiplies a tridiagonal, symmetric and real matrix stored in vectors x
% and y by a vector v.
% INPUT:
%   x - vector containing elements on the main diagonal of the matrix.
%   y - vector containing elements on the subdiagonal of the matrix.
%       It has one element less than vector x. Since the matrix is
%       symmetric, y is also equal to the respective elements of the
%       supradiagonal.
%   v - right operand of the multiplication operation
% Output:
%   u - result of the multiplication

% size of the problem
n = length(x);

u = 0*v;
u(1) = x(1)*v(1) + y(1)*v(2);

for i = 2:n-1
    u(i) = y(i-1)*v(i-1) + x(i)*v(i) + y(i)*v(i+1);
end % for

u(n) = y(n-1)*v(n-1) + x(n)*v(n);

end % function