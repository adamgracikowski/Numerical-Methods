function [Results, AbsErrorsEps, Speed, Times] = numtest_f(f, exact, nVals)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% This function is responsible for comparinng integrating formulas,
% calculating the absolute errors expressed in epsilons and finding
% quotients related to the convergence speed of each compared method
% Input:
%   f     - function handle to the integrated function of two variables 
%           y = f(x, y), which accepts a 2 by m matrix of arguments, 
%           where m is any arbitrary number of arguments 
%           The first row of the matrix are x values and the second row 
%           are respective y values
%   exact - scalar value representing an exact value of the integral
%   nVals - vector of values of the parameter n (which decides on the
%           number of partition triangles) for which the numerical test is
%           performed
% Output:
%   Results - 5 x length(nValues) matrix of integrals. Values in a given
%             row correspond to integrals evaluated by a single method
%   AbsErrorsEps - 5 x length(nValues) matrix of absolute errors expressed
%                  in epsilons. Values in a given row correspond to errors
%                  of a single method
%   Speed - 5 x length(nValues)-1 matrix of quotients related to the
%           convergence speed of each method. Values in a given row 
%           correspond to errors of a single method
%   Times - 5 x length(nValues)-1 matrix of execution times of each method.
%           Values in a given row correspond to errors of a single method

Functions = {@intSS, @intSW, @intSK, @intSSW, @intOverTriangle};

% transformation matrix
symmetryX = [1; -1];
symmetryY = [-1; 1];
T = [symmetryX, symmetryY, symmetryX];
Tsize = size(T, 2);

Results = zeros(5, length(nVals));
Times = 0*Results;

for i = 1:length(nVals)
    n = nVals(i);
    [a, b, c] = getQuadrant1Points(n);
    p = 1/(2*n*n);

    for j = 1:length(Functions)
        tic;
        Results(j, i) = Functions{j}(a, b, c, f, p);
        Times(j, i) = toc;
    end % for

    for k = 1:Tsize
        a = a .* T(:,k);
        b = b .* T(:,k);
        c = c .* T(:,k);

        for j = 1:length(Functions)
            tic;
            Results(j, i) = Results(j, i) + Functions{j}(a, b, c, f, p);
            Times(j, i) = toc;
        end % for
    end % for
end

% evaluating absolute error expressed in epsilons
AbsErrorsEps = abs(Results - exact)/eps;

% evaluating quotients related to the convergence speed
Speed = zeros(size(Results, 1), size(Results, 2) - 1);
for col = 1:size(AbsErrorsEps, 2)-1
    Speed(:, col) = AbsErrorsEps(:, col) ./ AbsErrorsEps(:, col+1);
end

end % function