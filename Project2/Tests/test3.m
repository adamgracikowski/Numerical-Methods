function [] = test3()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for transform3diag and backsubs3diag functions.

testData = get_testing_data(3);
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
    [A, b, x, y] = generate3system(n, testData.imin, testData.imax);
    
    % measuring execution time:
    tic; [x, y, z, U] = transform3diag(x, y);
    x_sol = backsubs3diag(x, y, z, b, U);
    testing_time = testing_time + toc;
    
    % evaluating the norm:
    difference = norm(A*x_sol - b) / eps;
    displayTestCase();
end % for

% displaying test summary:
fprintf("Total time (backsubs3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function [A, b, x, y] = generate3system(n, imin, imax)
        x = randi([imin, imax], 1, n);
        y = randi([imin, imax], 1, n-1);
        A = generate3diag(x, y);
        b = randi([imin, imax], n, 1);
    end
    function displayTestCase()
        % displays a test case in a formatted manner
        fw = 6; dp = 2;
        fprintf("Test Case %d:\n", i);
        fprintf("Matrix A:\n");
        fprintf_matrix(A, fw, dp);
        shouldPause = size(A, 1) > 4;
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        fprintf("Column vector b:\n");
        fprintf_matrix(b, fw, dp);
        shouldPause = size(A, 1) > 4;
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        fprintf("Solution x:\n");
        fprintf_matrix(x_sol, fw, dp);
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        fprintf("Norm: norm(Ax - b)/eps\n")
        fprintf_matrix(difference, fw, dp);
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
    function [] = pauseWithPrompt(prompt)
        % pauses the execution of a programme
        % with a meaningful prompt message
        fprintf(prompt);
        pause;
        fprintf("\n");
    end
    function [] = printLine(char, numOfChars)
        % prints a horizontal line on console
        fprintf('%s\n', repmat(char, 1, numOfChars));
    end
end % function