nVals = 1:1024;
Times = 0*nVals;

for i = 1:length(nVals)
    tic; P1Z28_AGR_int4n2(@f, i); Times(i) = toc;
end

plot(nVals, Times);
adjustAxes(gca);
title(['Czas całkowania w zależności od parametru n dla funkcji: ' ...
    'f(x, y) = e^{x + 2y}']);

function [] = adjustAxes(ax)
    % adds a grid lines to the plot
    ax.XGrid = "on";
    ax.XMinorGrid = "on";
    ax.YGrid = "on";
    ax.YMinorGrid = "on";
end
function z = f(xy)
    % tested function: f(x, y) = e^(x + 2y)
    z = exp(xy(1,:) + 2*xy(2,:));
end