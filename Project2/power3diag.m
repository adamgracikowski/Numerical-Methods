function res = power3diag(x, y, tol, iter, u)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Finds the dominant eigenvalue of the tridiagonal, symmetric and real
% matrix stored in vectors x and y using the power method.
% INPUT:
% x    - vector containing elements on the main diagonal of the matrix.
% y    - vector containing elements on the subdiagonal of the matrix.
% tol  - optional parameter determining the tolerance for the stop
%        condition of the power method, by default set to 1e-10.
% iter - optional parameter determining the maximum number of iterations,
%        after which the power method shall stop, by default set to 1000.
% u    - optional parameter determining the starting vector for the power
%        method. The vector should be horizontal and have the same length
%        as vector x.
% OUTPUT:
% res  - structure containing the following fields:
%        res.eigenvalue - value of the dominant eigenvalue found
%        by the power method.
%        res.eigenvector - eigenvector corresponding to the found
%        res.eigenvalue.
%        res.iterations - number of iterations, after which the power
%        method finished its execution.
%        res.relative_difference - the value of the relative difference in 
%        the last iteration of the algorithm.

% handling default arguments:
if nargin < 5; u = randn(length(x), 1); end
if nargin < 4; iter = 1000; end
if nargin < 3; tol = 1e-10; end

% iteration counter:
i = 0;
% initial value for the quotient evaluated for the stop condition:
d = tol + 1;
% preliminary for the main loop:
u = u / norm(u);
ev = u' * multiply3diag(x, y, u);

while i < iter && d > tol
    % power method step:
    u0 = u;
    u = multiply3diag(x, y, u);    
    % evaluating stop condition:
    d = norm(u - ev*u0)/abs(ev);
    % finding eigenvalue based on the current eigenvector:
    ev = u0'*u;
    % normalisation:
    u = u / norm(u);
    i = i + 1;
end % while

res = struct('iterations', i, ...
             'relative_difference', d, ...
             'eigenvalue', ev, ...
             'eigenvector', u);
end % function