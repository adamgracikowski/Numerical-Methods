function [x, y, z, U] = transform3diag(x, y)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Transforms a tridiagonal, symmetric and real matrix stored in vectors x
% and y to an upper-triangular matrix using Householder reflections. 
% All non-zero elements of vectors used in reflections are stored in
% respective columns of the U matrix.
% INPUT:
%   x - vector containing elements on the main diagonal of the matrix.
%   y - vector containing elements on the subdiagonal of the matrix.
% Output:
%   x - vector containing elements on the main diagonal of the transformed 
%       matrix.
%   y - vector containing elements on the supradiagonal of the transformed
%       matrix. It has one element less than vector x.
%   z - vector containing elements on the diagonal above y.
%       It has one two less than vector x.
%   U - a 2 by n-1 matrix (where n is the size of the matrix stored in x, 
%       y and z), which contains (its respective columns) non-zero elements
%       of vectors used in Householder reflections.

% size of the problem:
n = length(x);

U = zeros(2, n-1);
z = zeros(1, n-2);
y1 = y;
I = eye(2);

for i = 1:n-1
    % evaluating householder reflection:
    ai = [x(i); y1(i)];
    u = ai + sign(ai(1))*[norm(ai); 0];
    h = I - 2*(u*u')/(u'*u);

    % updating matrix elements:
    p = h*[x(i), y(i); y1(i), x(i+1)];
    x(i) = p(1,1); 
    x(i+1) = p(2,2); 
    y(i) = p(1,2); 
    y1(i) = 0;

    if i < n-1
        % filling additional z diagonal:
        z(i) = h(1,1)*z(i) + h(1,2)*y(i+1);
        y(i+1) = h(2,2)*y(i+1);
    end % if
    
    % storing u vector:
    U(:,i) = u;
end % for

end % function