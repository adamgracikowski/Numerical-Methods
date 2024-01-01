function [] = test6()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for power3diag function for the case of Toeplitz matrices.
% The formula for eigenvalues used in a test, with a proper proof and
% explanation can be found here: 
% https://hal.science/hal-01461924/file/KST.pdf
% The objective of the test is to evaluate the speed of convergence of the
% power method.

testData = get_testing_data(6);
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
    n = testData.n(i); a = testData.a(i); b = testData.b(i);
    [A, x, y] = generate3toeplitz(n, a, b);
    u = randn(n, 1);
    
    % evaluating expected values based on explicit formula for eigenvalues:
    teoplitz_eigenvalues = sort(abs(a + 2*abs(b)*cos(pi*(1:n)/(n + 1))));
    eig1 = teoplitz_eigenvalues(end);
    eig2 = teoplitz_eigenvalues(end-1);

    % evaluating error based on a number of iterations:
    error = zeros(1, testData.iter(i));
    for j = 1:testData.iter(i)
        % measuring execution time:
        tic; result = power3diag(x, y, 0, j, u);
        testing_time = testing_time + toc;
        error(j) = result.relative_difference;
    end % for
    
    % applying linear regression:
    iter = 1:testData.iter(i);
    [actual, ~] = linear_regression(iter(error > eps), ...
        log10(error(error > eps)));
    expected = log10(eig2/eig1);
    displayTestCase();
end % for

% displaying test summary:
fprintf("Total time (power3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function [A, x, y] = generate3toeplitz(n, a, b)
        x = a * ones(1, n);
        y = b * ones(1, n-1);
        A = generate3diag(x, y);
    end
    function [a, b] = linear_regression(x, y)
        x = x(:); y = y(:);
        m = length(x);
        sx = sum(x); sy = sum(y);
        sxy = sum(x.*y); sx2 = sum(x.*x);
        a = (m*sxy - sx*sy)/(m*sx2 - sx^2);
        b = (sy - a*sx)/m;
    end
    function displayTestCase()
        % displays a test case in a formatted manner
        header = sprintf('| %-20s | %-20s |', ...
            "Expected:", ...
            "Actual:");
        fprintf("Test Case %d:\n", i);
        fprintf("Toeplitz matrix:\n");
        fprintf_matrix(A, 2, 0);
        shouldPause = size(A, 1) > 4;
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        printTable("Power Method:", header, ...
            [expected, actual]);
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
        fprintf("| %20.10f | %20.10f |\n", ...
            row(1), row(2));
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