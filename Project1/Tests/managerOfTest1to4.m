function [] = managerOfTest1to4(testData, p)
% Project 1, Assignment 28
% Adam Grącikowski, 327350
%
% Performs the common part for tests 1-4 
% and formats the results in a tabular manner

nValues = [1, 2, 4, 8, 16, 32, 64, 128, 512, 1024];
testingTime = 0;

% displaying description:
for i = 1:length(testData.Description)
    fprintf(testData.Description(i));
end % for

pauseWithPrompt("\t\tPress any key to continue...");

% creating a header for each table:
header = sprintf('\t\t%-4s | %-20s | %-19s', ...
    'n', 'P1Z28_AGR_int4n2', 'absolute error (int eps)');

for i = 1:length(testData.VectorOfCases)
    printLine('-', length(header));
    fprintf('case%d:  formula: %s\n', ...
        i, testData.VectorOfCases(i).formula);
    fprintf('\t\texact integral: %d\n', testData.VectorOfCases(i).exact);
    printLine('-', length(header));
    fprintf("%s\n", header);
    printLine('-', length(header));

    for j = 1:length(nValues)
        testingTime = testingTime + ...
            presentResults(testData.VectorOfCases(i), nValues(j));
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
    function [t] = presentResults(testCase, n)
        % displays the row of the table 
        % and measures the execution time of P1Z28_AGR_int4n2
        tic;
        int4n2Result = P1Z28_AGR_int4n2(testCase.function, n);
        t = toc;
        abserr = abs(testCase.exact - int4n2Result);
        fprintf('\t\t%-4d | %20.15f | %26.2f\n', ...
            n, int4n2Result, abserr/eps);
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