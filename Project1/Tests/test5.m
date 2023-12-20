function [] = test5(p)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Test for order of accuracy error, which is O(1/n^4)

if nargin == 0; p = true; end

testData = getTestingData(5);
nValues = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512];
testingTime = 0;

% displaying description:
for i = 1:length(testData.Description)
    fprintf(testData.Description(i));
end % for

pauseWithPrompt("\t\tPress any key to continue...");

% creating a header for each table:
header = sprintf('\t\t%-4s | %-20s | %-15s | %-12s', ...
    'n', 'P1Z28_AGR_int4n2', 'absolute error (int eps)', 'quotient');

for i = 1:length(testData.VectorOfCases)
    printLine('-', length(header));
    fprintf('case%d:  formula: %s\n', ...
        i, testData.VectorOfCases(i).formula);
    fprintf('\t\texact integral: %-20.15f\n', ...
        testData.VectorOfCases(i).exact);
    printLine('-', length(header));
    fprintf("%s\n", header);
    printLine('-', length(header));
    
    last_error = NaN;
    for j = 1:length(nValues)
        [last_error, testingCaseTime] = presentResults( ...
            testData.VectorOfCases(i), nValues(j), last_error);
        testingTime = testingTime + testingCaseTime;
    end % for

    printLine('-', length(header));

    if p
        if i == length(testData.VectorOfCases)
            pauseWithPrompt("\t\tPress any key to proceed " + ...
                "to testing time summary...");
        else
            pauseWithPrompt("\t\tPress any key to proceed " + ...
                "to the next test case...");
        end % if
    end % if
end % for

printLine('-', length(header));
fprintf(['\t\tTotal time spent in P1Z28_AGR_int4n2: ' ...
    '%.2f seconds\n'], testingTime);
printLine('-', length(header));

    % helper functions:
    function [last_error, t] = presentResults(testCase, n, last_error)
        % displays the row of the table
        % and measures the execution time of P1Z28_AGR_int4n2
        tic;
        int4n2Result = P1Z28_AGR_int4n2(testCase.function, n);
        t = toc;
        abserr = abs(testCase.exact - int4n2Result);
        if isnan(last_error)
        fprintf('\t\t%-4d | %20.15f | %24.0f |\n', ...
            n, int4n2Result, abserr/eps);
        last_error = abserr;
        else % if
        quotient = last_error/abserr;
        last_error = abserr;
        fprintf('\t\t%-4d | %20.15f | %24.0f | %14.10f\n', ...
            n, int4n2Result, abserr/eps, quotient);
        end % for
    end
    function [] = printLine(char, numOfChars)
        % prints a horizontal line on console
        fprintf('\t\t%s\n', repmat(char, 1, numOfChars));
    end
    function [] = pauseWithPrompt(prompt)
        % pauses the execution of a programme
        % with a meaningful prompt message
        fprintf(prompt);
        pause;
        fprintf("\n");
    end
end % function