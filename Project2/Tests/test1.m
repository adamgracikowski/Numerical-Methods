function [] = test1()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for multiply3diag function.

testDescription = [
"\tThis test is responsible for examining the correctness of the\n", ...
"\tmultiplication operation for the case when the operands are:\n", ...
"\ta tridiagonal, symmetric and real matrix and a column vector.\n", ...
"\tIn each test case, the following are displayed:\n", ...
"\ta matrix being the right operand,\n", ...
"\ta column vector being the left operand,\n", ...
"\tand the norm of the difference between the expected value\n", ...
"\tof the product and the value obtained using\n", ...
"\tthe multiply3diag function. The norm is expressed as a multiple\n", ...
"\tof epsilon.\n"];
nVals = [2, 3, 4, 8, 10];
numOfTestCases = length(nVals);
imin = 1;
imax = 9;
testing_time = 0;

% displaying description:
fprintf("Desc:\n");
for i = 1:length(testDescription)
    fprintf(testDescription(i));
end % for

pauseWithPrompt("Press any key to continue...");
printLine('-', 75);

for i = 1:numOfTestCases
    A = randi3diag(nVals(i), imin, imax);
    v = randi([imin, imax], nVals(i), 1);
    x = diag(A);
    y = diag(A, 1);
    
    % measuring execution time
    expected = A*v; 
    tic; actual = multiply3diag(x, y, v); 
    testing_time = testing_time + toc;    
    
    % evaluating the norm
    difference = norm(expected - actual) / eps;
    displayTestCase();
end % for

% displaying test summary
fprintf("Total testing time (multiply3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function displayTestCase()
        % displays a test case in a formatted manner
        fw = 3; dp = 0;
        fprintf("Test Case %d:\n", i);
        fprintf("Matrix:\n"); fprintf_matrix(A, fw, dp);
        fprintf("Column vector:\n"); fprintf_matrix(v, fw, dp);
        fprintf("Norm: norm(expected - actual)/eps\n")
        fprintf_matrix(difference, fw, dp);
        if i ~= numOfTestCases
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