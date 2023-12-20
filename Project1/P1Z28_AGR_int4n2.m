function S = P1Z28_AGR_int4n2(f, n)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Calculating the double integral of f over area D, where D = D1 - D2
% D1 = [-1, 1] x [-1, 1], 
% D2 = {(x, y): |x| + |y| <= 1}
% by dividing D into 4n^2 congruent triangles and applying a quadrature
% of the fourth order for each of the triangles
% Input:
%   f - function handle to the integrated function of two variables 
%       y = f(x, y), which accepts a 2 by m matrix of arguments, 
%       where m is any arbitrary number of arguments 
%       The first row of the matrix are x values and the second row 
%       are respective y values
%   n - scalar parameter determining the number of triangles, 
%       which is 4n^2
% Output:
%   S - scalar value representing the double integral of f 
%       over the area D

numOfQuadrants = 4;

% transformation marix
symmetryX = [1; -1];
symmetryY = [-1; 1];
T = [symmetryX, symmetryY, symmetryX];
Tsize = size(T, 2);

[a, b, c] = getQuadrant1Points(n);

% calculating the area of each congruent triangle
p = 1/(2*n*n);

% summing the integrals across the triangles in all 4 quadrants
Sv =  zeros(1, numOfQuadrants);
Sv(1) = intOverTriangle(a, b, c, f, p);

for i = 1:Tsize
    a = a .* T(:,i);
    b = b .* T(:,i);
    c = c .* T(:,i);
    Sv(i+1) = intOverTriangle(a, b, c, f, p);
end % for

S = sum(Sv);

end % function