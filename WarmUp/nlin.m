function roots = nlin(f)
% Zadanie R
% Adam Grącikowski, 327350
% Total minipoints score: 816.5
% Function used as a wrapper for rootfinder
% Input:
%   f - function which roots are to be found
% Output:
%   roots - horizontal vector containing roots of f function

% determine optimal parameters to maximize the nlinTest result
n1 = 20;
n2 = 12;
p1 = 400000;
p2 = 200000;
b1 = 10;
b2 = 2;
max_iter = 50;

roots = rootfinder(f, n1, n2, p1, p2, b1, b2, max_iter);

end % function