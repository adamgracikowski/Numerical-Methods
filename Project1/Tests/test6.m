function [] = test6()
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Test for division of the integration area
% This test allows the user to interactively manipulate the number of
% partition triangles

% setting up a uifigure:
screenSize = get(0, 'ScreenSize');
figName = 'test6: Division of integration area by divideTriangleN2';
figSize = [500, 600];
figPosition = [(screenSize(3)-figSize(1))/2, ...
    (screenSize(4)-figSize(2))/2, figSize];

fig = uifigure('Name', figName, ...
    'Position', figPosition, ...
    'Resize', 'off');

% setting up axes:
axPosition = [0.1, 0.3, 0.8, 0.6];

ax = axes(fig, 'Position', axPosition);
adjustAxes(ax);

% setting up a uispinner:
spinnerSize = [100, 20];
spinnerPosition = [(figSize(1)-spinnerSize(1))/2, 50, spinnerSize];
spinnerLimits = [1, 16];
tooltip = 'Pick a new value of n for the division of the area D';

spinner = uispinner(fig, "Limits", spinnerLimits, ...
    "Position", spinnerPosition, ...
    "ValueChangedFcn", @(src, event) updatePlot(ax, src), ...
    "Tooltip", tooltip);

spinner.Value = 1;
updatePlot(ax, spinner);

% setting up a label:
labelText = ['This test is responsible for examining correctness ' ...
    'of division of the integration area D into into 4n^2 congruent ' ... 
    'triangles. The current value of n can be changed using ' ...
    'the interactive box below.'];
labelSize = [350, 100];
labelPosition = [(figSize(1)-labelSize(1))/2, 80, labelSize];
uilabel(fig, "Text", labelText, ...
    "Position", labelPosition, ...
    "WordWrap", "on", ...
    "FontSize", 14);

    % helper functions
    function updatePlot(ax, spinner)
        % updates the plot based on the slider's value
        bgcolor = [0.8, 0.8 1];
        opacity = 0.2;
        lineWidth = 0.1;

        n = spinner.Value;

        symmetryX = [1; -1];
        symmetryY = [-1; 1];
        T = [symmetryX, symmetryY, symmetryX];
        Tsize = size(T, 2);

        x1 = [0, 1, 1];
        y1 = [1, 1, 0];

        cla(ax);
        hold(ax, "on");
        fill(ax, x1, y1, bgcolor, ...
            'FaceAlpha', opacity, ...
            'LineWidth', lineWidth);

        [a, b, c] = divideTriangleN2([0;1], [1;1], [1;0], n);
        plotTriangles(ax, a, b, c);

        for i = 1:Tsize
            x1 = x1 .* T(1, i);
            y1 = y1 .* T(2, i);
            a = a .* T(:, i);
            b = b .* T(:, i);
            c = c .* T(:, i);
            fill(ax, x1, y1, bgcolor, ...
                'FaceAlpha', opacity, ...
                'LineWidth', lineWidth);
            plotTriangles(ax, a, b, c);
        end % for
        hold(ax, "off");
%         title(ax, ['Division of area D into 4n^2 congruent ' ...
%             'triangles for n = ', num2str(n)], "FontSize", 12);
    end
    function adjustAxes(ax)
        % styles the axes properly
        axis(ax, "equal");
        ax.XLim = [-2, 2];
        ax.YLim = [-2, 2];
        ax.XTick = [-2, -1, 0, 1, 2];
        ax.YTick = [-2, -1, 0, 1, 2];
        ax.XAxisLocation = "origin";
        ax.YAxisLocation = "origin";
        ax.XGrid = "on";
        ax.YGrid = "on";
    end
    function plotTriangles(ax, a, b, c)
        % plots triangles which vertices are in matrices a, b and c
        triangleColor = [0 0 1];
        x = [a(1, :); b(1, :); c(1, :); a(1, :)];
        y = [a(2, :); b(2, :); c(2, :); a(2, :)];
        plot(ax, x, y, 'Color', triangleColor);
    end
end % function