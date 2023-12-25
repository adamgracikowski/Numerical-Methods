function [] = test9()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for correctness of the implementation of the inverse3diag 
% function in terms of achieving the specified accuracy of 
% approximation of the eigenvalue with the least absolute value. 

testData = get_testing_data(9);
testing_time = 0;

% displaying description:
fprintf("Desc:\n");
for i = 1:length(testData.description)
    fprintf(testData.description(i));
end % for

pauseWithPrompt("Press any key to continue...");
printLine('-', 75);

expected = 0*testData.tol;
actual = 0*testData.tol;
iterations = 0*testData.tol;

for i = 1:testData.numOfTestCases
    A = testData.A{i};
    x = diag(A); y = diag(A, 1);
    u = randn(length(x), 1);
    displayTestCase();
end % for

% displaying test summary:
fprintf("Total time (inverse3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function displayTestCase()
        % displays a test case in a formatted manner
        header = sprintf('| %-20s | %-20s | %-20s |', ...
            "Expected:", ...
            "||Av - λv||:", ...
            "Iterations:");
        fprintf("Test Case %d:\n", i);
        fprintf("Matrix: %s\n", testData.names(i));
        fprintf_matrix(A, 2, 0);
        shouldPause = size(A, 1) > 4;
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        printTable("Tolerance:", header);
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
    function [] = printTable(title, header)
        % displays a table in a formatted manner:
        headerLength = length(header);
        fprintf("%s\n", title);
        printLine('-', headerLength, '+', '+');
        fprintf("%s\n", header);
        printLine('-', headerLength, '+', '+');
        for j = 1:length(testData.tol)
            % measuring execution time:
            tic; result = inverse3diag(x, y, testData.tol(j), ...
                testData.iter, u);
            testing_time = testing_time + toc;
            
            expected(j) = testData.tol(j);
            actual(j) = norm(A*result.eigenvector - ...
                result.eigenvalue*result.eigenvector);
            iterations(j) = result.iterations;
            
            % displaying a row of the table:
            fprintf("| %20.2e | %20.2e | %20d |\n", ...
            expected(j), actual(j), iterations(j));
        end % for
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
        if nargin < 4; charEnd = char; end % if
        if nargin < 3; charStart = char; end % if
        fprintf('%c%s%c\n', charStart, ...
            repmat(char, 1, numOfChars - 2), charEnd);
    end
end % function