function [] = test2()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Test for transform3diag function.

testData = get_testing_data(2);
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
    A = randi3diag(n, testData.imin, testData.imax);
    x = diag(A);
    y = diag(A, 1);
    % measuring execution time:
    tic; [x, y, z, U] = transform3diag(x, y);
    testing_time = testing_time + toc;
    
    % evaluating the norm:
    R = generateR(x, y, z);
    Q = generateQ(n, U);
    difference = norm(A - Q*R, "fro") / eps;
    
    displayTestCase();
end % for

% displaying test summary:
fprintf("Total testing time (transform3diag) in seconds: %10.6f\n", ...
    testing_time);
printLine('-', 75);

    function R = generateR(x, y, z)
        R = diag(x) + diag(y, 1) + diag(z, 2);
    end
    function H = generateH(u, j, n)
        I = eye(2);
        H = eye(n);
        h = I - 2*(u*u')/(u'*u);
        H(j:j+1,j:j+1) = h;
    end
    function Q = generateQ(n, U)
        Q = eye(n);
        for j = 1:n-1
            H = generateH(U(:, j), j, n);
            Q = Q * H';
        end % for
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
        fprintf("Matrix R:\n");
        fprintf_matrix(R, fw, dp);
        if shouldPause
            pauseWithPrompt("Press any key to continue...");
        end % if
        fprintf("Norm: norm(A - QR)/eps\n")
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