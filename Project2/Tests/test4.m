function [] = test4()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for P2Z20_AGR_cond3diag function for the case of Toeplitz matrices.
% The formula for eigenvalues used in test4, with a proper proof and
% explanation can be found here: 
% https://hal.science/hal-01461924/file/KST.pdf

testData = get_testing_data(4);
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
    a = randi([testData.imin, testData.imax]); 
    b = randi([testData.imin, testData.imax]);
    while b == a
        b = randi([testData.imin, testData.imax]);
    end % while
    [A, x, y] = generate3toeplitz(n, a, b);
    
    % evaluating expected values based on explicit formula for eigenvalues:
    teoplitz_eigenvalues = a + 2*abs(b)*cos(pi*(1:n)/(n + 1));
    [~, idx] = max(abs(teoplitz_eigenvalues));
    eig_power_expected = teoplitz_eigenvalues(idx);
    [~, idx] = min(abs(teoplitz_eigenvalues));
    eig_inverse_expected = teoplitz_eigenvalues(idx);
    cond_expected = abs(eig_power_expected/eig_inverse_expected);
    
    % measuring execution time:
    tic; result = P2Z20_AGR_cond3diag(x, y);
    testing_time = testing_time + toc;
    eig_power_actual = result.power.eigenvalue;
    eig_inverse_actual = result.inverse.eigenvalue;
    cond_actual = result.cond;
    
    % evaluating the absolute error:
    difference(1) = abs(eig_power_expected - eig_power_actual)/eps;
    difference(2) = abs(eig_inverse_expected - eig_inverse_actual)/eps;
    difference(3) = abs(cond_expected - cond_actual)/eps;
    
    displayTestCase();
end % for

% displaying test summary:
fprintf("Total time (cond3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function [A, x, y] = generate3toeplitz(n, a, b)
        x = a*ones(1, n);
        y = b*ones(1, n-1);
        A = generate3diag(x, y);
    end
    function displayTestCase()
        % displays a test case in a formatted manner
        header = sprintf('| %-20s | %-20s | %-20s |', ...
            "Expected:", ...
            "Actual:", ...
            "Difference (in eps):");
        fprintf("Test Case %d:\n", i);
        fprintf("Toeplitz matrix:\n");
        fprintf_matrix(A, 2, 0);
        shouldPause = size(A, 1) > 4;
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        printTable("Power Method:", header, ...
            [eig_power_expected, eig_power_actual, difference(1)]);
        printTable("Inverse Power Method:", header, ...
            [eig_inverse_expected, eig_inverse_actual, difference(2)]);
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
        fprintf("| %20.10f | %20.10f | %20.10f |\n", ...
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