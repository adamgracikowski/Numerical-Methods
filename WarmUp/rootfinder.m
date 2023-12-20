function roots = rootfinder(f, n1, n2, p1, p2, b1, b2, max_iter)
% Zadanie R
% Adam Grącikowski, 327350
%
% Function used to find as many roots of f as possible
% in a reasonable time frame
% As the main underlying algorithm a vectorised bisection was chosen
% Input:
%   f - function which roots are to be found
%   n1 - first exponent in a sampling vector
%   n2 - second exponent in a sampling vector
%   p1 - first number of points in a sampling vector
%   p2 - second number of points in a sampling vector
%   b1 - first base of the power in a sampling vector
%   b2 - second base of the power in a sampling vector
%   max_iter - maximum number of iterations used in bisection method
% Output:
%   roots - horizontal vector containing real roots of the f function

% create sampling vector
values = [-nlinspace(n1, 0, p1, b1) ...
    -nlinspace(0, -n2, p2, b2) 0 ...
    nlinspace(-n2, 0, p2, b2) ...
    nlinspace(0, n1, p1, b1)];

% get rid of imaginary numbers
D = [values; f(values)];
D = D(:, isnotimag(D(2, :)));

% find correct verges of intervals such that: f(a)*f(b) < 0
a = D(1, diff(D(2, :) > 0) ~= 0);
b = D(1, [0 diff(D(2, :) > 0)] ~= 0);

n = size(a, 2);
active = true(1, n);
iter = 0*active;
roots = 0*active;
d = eps*ones(1, n);

% perform vectorised bisection
while any(active)
    iter(active) = iter(active) + 1;
    roots(active) = (a(active) + b(active))/2;

    % turn chosen roots into inactive mode
    d(active & roots >= 1) = eps*abs(roots(active & roots >= 1));
    active = active & f(roots - 500*d) .* f(roots + 500*d) >= 0;
    active(iter > max_iter) = 0;

    % reduce intervals
    idx = f(a) .* f(roots) < 0;
    a(active & ~idx) = roots(active & ~idx);
    b(active & idx) = roots(active & idx);
end % while

end % function