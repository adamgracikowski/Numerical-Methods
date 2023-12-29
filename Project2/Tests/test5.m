function [] = test5()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for cond3diag for the case of huge matrices.

testData = get_testing_data(5);
testing_time = 0;

% displaying description:
fprintf("Desc:\n");
for i = 1:length(testData.description)
    fprintf(testData.description(i));
end % for

pauseWithPrompt("Press any key to continue...");
printLine('-', 75);

for i = 1:testData.numOfTestCases
    % setting up a test case:
    n = testData.n(i);
    [x, y] = generate3eig(testData.eigs{i});

    % evaluating expected values:
    [~, idx] = max(abs(testData.eigs{i}));
    eig_power_expected = testData.eigs{i}(idx);
    [~, idx] = min(abs(testData.eigs{i}));
    eig_inverse_expected = testData.eigs{i}(idx);
    cond_expected = abs(eig_power_expected/eig_inverse_expected);

    % measuring execution time:
    tic; result = cond3diag(x, y, testData.tol{i}, testData.iter{i});
    testing_time = testing_time + toc;

    eig_power_actual = result.power.eigenvalue;
    eig_inverse_actual = result.inverse.eigenvalue;
    cond_actual = result.cond;

    % evaluating the absolute error:
    difference(1) = result.power.last_eigenvector_change/eps;
    difference(2) = result.inverse.last_eigenvector_change/eps;
    difference(3) = abs(cond_expected - cond_actual)/eps;

    displayTestCase();
end % for

% displaying test summary:
fprintf("Total time (cond3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function [x, y] = generate3eig(eigs)
        % Generates a tridiagonal, symmetric and real matrix, which is
        % stored in vectores x and y. The matrix has eigenvalues equal to
        % respective elements of eigs vector.
        m = length(eigs);
        x = eigs(:);
        y = zeros(m-1, 1);
        for j = 1:2:m-1
            % the angle theta is randomly chosen
            % from the interval (0, pi):
            theta = rand * pi;
            c = cos(theta);
            s = sin(theta);
            G = [c -s; s c];
            % applying Givens rotation:
            A = G * diag(x(j:j+1)) * G';
            % updating elements of vectors x and y:
            x(j:j+1) = diag(A);
            y(j) = A(1,2);
        end % for
    end
    function displayTestCase()
        % displays a test case in a formatted manner
        header = sprintf('| %-20s | %-20s | %-20s |', ...
            "Expected:", ...
            "Actual:", ...
            "Last change (in eps):");
        fprintf("Test Case %d:\n", i);
        fprintf("Matrix: %d x %d\n", n, n);
        printTable("Power Method:", header, ...
            [eig_power_expected, eig_power_actual, difference(1)]);
        printTable("Inverse Power Method:", header, ...
            [eig_inverse_expected, eig_inverse_actual, difference(2)]);
        header = sprintf('| %-20s | %-20s | %-20s |', ...
            "Expected:", ...
            "Actual:", ...
            "Difference (in eps):");
        printTable("Condition Number:", header, ...
            [cond_expected, cond_actual, difference(3)]);
        if i ~= testData.numOfTestCases
            prompt = "Press any key to proceed to " + ...
                "the next test case...\n";
        else
            prompt = "Press any key to proceed to " + ...
                "testing time summary...\n";
        end % if
        pauseWithPrompt(prompt);
        printLine('-', 75);
    end
    function [] = printTable(title, header, row)
        headerLength = length(header);
        fprintf("%s\n", title);
        printLine('-', headerLength, '+', '+');
        fprintf("%s\n", header);
        printLine('-', headerLength, '+', '+');
        fprintf("| %20.10f | %20.10f | %20.2f |\n", ...
            row(1), row(2), row(3));
        printLine('-', headerLength, '+', '+');
    end
    function [] = pauseWithPrompt(prompt)
        % pauses the execution of a programme
        % with a meaningful prompt message
        fprintf(prompt);
        pause;
        fprintf("\n");
    end
    function [] = printLine(char, numOfChars, charStart, charEnd)
        % prints a horizontal line on console
        if nargin < 4; charEnd = char; end
        if nargin < 3; charStart = char; end
        fprintf('%c%s%c\n', charStart, ...
            repmat(char, 1, numOfChars - 2), charEnd);
    end
end % function