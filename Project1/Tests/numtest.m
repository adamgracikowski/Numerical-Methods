function [] = numtest()
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% This function performs a comparison of compound quadratures

% setting up test data
Functions = {@f1, @f2};
FunctionFormulas = [" f(x, y) = e^{x + 2y}", " f(x, y) = 3x^4 + 3y^4"];
Exacts = [(exp(1) - sinh(1) + cosh(1) - 8*cosh(2) + 6*cosh(3))/6, 4];
nVals = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024];
Speeds = cell(1, length(Functions));

title1 = ['Porównanie błędu bezwzględnego wyrażonego w epsilonach ' ...
    'dla metod całkowania na trójkącie dla: '];
title2 = ['Porównanie czasu obliczeniowego '...
    'dla metod całkowania na trójkącie dla: '];

for i = 1:length(Functions)
    % calculating integrals, errors and convergence speed quotients
    [~, AbsErrorsEps, Speeds{i}, Times] = ...
        numtest_f(Functions{i}, Exacts(i), nVals);
    
    % creating a plot
    figure;
    semilogy(nVals, AbsErrorsEps);
    adjustAxes(gca);
    title(strcat(title1, FunctionFormulas(i)));
    legend('S_{S}', 'S_{W}', 'S_{K}', 'S_{SW}', 'S_{SWK}');
    
    % creating a plot
    figure;
    plot(nVals, Times);
    adjustAxes(gca);
    title(strcat(title2, FunctionFormulas(i)));
    legend('S_{S}', 'S_{W}', 'S_{K}', 'S_{SW}', 'S_{SWK}');
end % for
    
    function [] = adjustAxes(ax)
        % adds a grid lines to the plot
        ax.XGrid = "on";
        ax.XMinorGrid = "on";
        ax.YGrid = "on";
        ax.YMinorGrid = "on";
    end
    function z = f1(xy)
        % first tested function: f(x, y) = e^(x + 2y)
        z = exp(xy(1,:) + 2*xy(2,:));
    end
    function z = f2(xy)
        % second tested function: f(x, y) = 3x^4 + 3y^4
        z = 3*xy(1,:).^4 + 3*xy(2,:).^4;
    end
end % function