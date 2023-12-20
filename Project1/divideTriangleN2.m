function [a, b, c] = divideTriangleN2(p0, p1, p2, n)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Divides triangle into n^2 congruent subtriangles
% Input:
%   p0, p1, p2 - vertices of the triangle given as 2 x 1 vectors
%   n - parameter determining the number of subtriangles (n^2)
% Output:
%   a, b, c - 2 x n^2 matrices of respective vertices of subtriangles

a = zeros(2, n*n);
b = 0*a;
c = 0*a;

% declaring starting point and offset vectors
p = p0;
v1 = (p1 - p)/n;
v2 = (p2 - p)/n;

k = 1;
for i = 1:n
    for j = 1:(n-i+1)
        a(:,k) = p + (j - 1)*v1;
        b(:,k) = p + j*v1;
        c(:,k) = p + v2 + (j - 1)*v1;
        k = k + 1;
    end % for
    p = p + v2;
end % for

% updating starting point and offset vector
p = p0 + v2;
v2 = v1 - v2;

for i = 1:n-1
    for j = 1:(n-i)
        a(:,k) = p + (j - 1)*v1;
        b(:,k) = p + j*v1;
        c(:,k) = p + v2 + (j - 1)*v1;
        k = k + 1;
    end % for
    p = p + (v1 - v2);
end % for

end % function