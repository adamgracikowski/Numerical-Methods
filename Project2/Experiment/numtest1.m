% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Comparing execution time for LU decomposition (performed in inverse3lu) 
% and Householder transformation (performed in inverse3diag).

% setup for the test:
n = 200000;
iter = 1:25;
time_householder = 0*iter;
time_lu = 0*iter;

% generating data:
x = randn(n, 1);
y = randn(n-1, 1);
u = randn(n, 1);

for i = iter
    % measuring execution time for inverse3diag:
    tic;
    result_householder = inverse3diag(x, y, 0, iter(i), u);
    time_householder(i) = toc;

    % measuring execution time for inverse3lu:
    tic;
    result_lu = inverse3lu(x, y, 0, iter(i), u);
    time_lu(i) = toc;
end % for

% plotting results:
plot(iter, time_lu, iter, time_householder);
legend('inverse3lu', 'inverse3diag');
legend('Location', 'southeast');
adjustAxes(gca);

function [] = adjustAxes(ax)
    % adds grid and minor grid on both axes
    ax.XGrid = "on";
    ax.XMinorGrid = "on";
    ax.YGrid = "on";
    ax.YMinorGrid = "on";
end