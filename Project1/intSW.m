function S = intSW(a, b, c, f, p)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Calculates the double integral of f over triangles given by a, b, c using
% a compound quadrature of the second order
% All of the triangles have the area equal to p
% Input:
%   a, b, c - 2 x n matrices (where n is any arbitrary number of columns)
%             containing respective vertices of congruent triangles
%             The first row of each matrix contains x coordinates of each
%             vertex and the second row contains respective y coordinates
%   f - function handle to the integrated function of two variables 
%       y = f(x, y), which accepts a 2 by m matrix of arguments, 
%       where m is any arbitrary number of arguments 
%       The first row of the matrix are x values and the second row 
%       are respective y values
%   p - scalar value equal to the area of each triangle
% Output:
%   S - scalar value representing the double integral of f 
%       over the area determined by the triangles given as a, b, c

S = p/3 * sum(f(a) + f(b) + f(c));

end % function