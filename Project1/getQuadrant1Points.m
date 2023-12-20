function [a, b, c] = getQuadrant1Points(n)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Returns n^2 congruent subtriangles which form the triangle 
% from the D area, situated in the first quadrant of the 
% coordinate system with vertices: (0, 1), (1, 1), (1, 0) 
% Input:
%   n - parameter determining the number of subtriangles (n^2)
% Output:
%   a, b, c - 2 x n^2 matrices of respective vertices of subtriangles

p0 = [0; 1];
p1 = [1; 1];
p2 = [1; 0];

[a, b, c] = divideTriangleN2(p0, p1, p2, n);

end % function

