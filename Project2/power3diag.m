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
%        res.last_eigenvector_change - the value of the norm evaluated
%        for the stop condition in the last iteration of the power method.

% handling default arguments
if nargin < 5; u = randn(length(x), 1); end
if nargin < 4; iter = 1000; end
if nargin < 3; tol = 1e-10; end

% iteration counter
i = 0;
% stop condition based on tolerance, initially set to false
b = false;

% preliminary for the main loop
u = u / norm(u);
u0 = u;
[~, idx] = max(abs(u0));
s0 = sign(u0(idx));
d = norm(s0*u - s0*u0);

while i < iter && ~b
    % power method step
    u = multiply3diag(x, y, u);

    % normalisation
    u = u / norm(u);

    % finding sign of the maximal coefficient to ensure consistency in
    % calculating change in eigenvectors
    [~, idx] = max(abs(u));
    s = sign(u(idx));

    % evaluating stop condition
    d = norm(s*u - s0*u0);
    b = d < tol;

    % updating the previous iteration parameters
    u0 = u;
    s0 = s;

    i = i + 1;
end % while

% determining the eigenvalue based on the eigenvector
ev = u' * multiply3diag(x, y, u);

res = struct('iterations', i, ...
             'last_eigenvector_change', d, ...
             'eigenvalue', ev, ...
             'eigenvector', u);
end % function