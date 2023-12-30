% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Comparing precision of solutions of Ax = b found by using LU 
% decomposition and Householder transformations by evaluating ||Ax - b||.

% setup for the test:
nVals = 2:2:2000;
err_lu = 0*nVals;
err_householder = 0*nVals;

for i = 1:length(nVals)
    n = nVals(i);
    
    % generating data:
    x = randn(n, 1);
    y = randn(n-1, 1);
    b = randn(n, 1);
    
    % solving Ax = b using Householder transformations:
    [xd, yd, zd, U] = transform3diag(x, y);
    r_householder = backsubs3diag(xd, yd, zd, b, U);
    % evaluating the norm ||Ax - b||:
    err_householder(i) = norm(multiply3diag(x, y, r_householder) - b)/eps;

    % solving Ax = b using LU decomposition:
    [yd, zd, dd, P, K] = lu3diag(y, x, y);
    r_lu = gepp3diag(yd, zd, dd, b, P, K);
    % evaluating the norm ||Ax - b||:
    err_lu(i) = norm(multiply3diag(x, y, r_lu) - b)/eps;
end % for

% plotting results:
semilogy(nVals, err_lu, nVals, err_householder);
legend('lu', 'householder');
legend('Location', 'southeast');
adjustAxes(gca);

function [] = adjustAxes(ax)
    % adds grid and minor grid on both axes
    ax.XGrid = "on";
    ax.XMinorGrid = "on";
    ax.YGrid = "on";
    ax.YMinorGrid = "on";
end