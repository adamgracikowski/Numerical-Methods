function [testData] = get_testing_data(testNumber)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% The sole purpose of this function is setting up data
% for testing functions from 1 to 3

if ~ismember(testNumber, 1:3)
    error("Invalid test number provided.");
end % if

if testNumber == 1
    % setting up data for test1:
    testData.description = [
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
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.imin = 1;
    testData.imax = 9;
    return;
end % if

if testNumber == 2
    % setting up data for test1:
    testData.description = [
    "\tThis test is responsible for examining the correctness of\n", ...
    "\ttransforming a tridiagonal, symmetric and real matrix to\n", ...
    "\tan upper-triangular form, using Householder reflections.\n", ...
    "\tIn each test case, the following are displayed: a matrix A being\n", ...
    "\tthe subject of the transformation, an actual form of the R matrix\n", ...
    "\t(after transformation) obtained using transform3diag function and\n", ...
    "\tFrobenius norm: ||A - QR|| expressed in epsilons, where Q is\n", ...
    "\ta matrix created by multiplying transpositions of Householder\n", ...
    "\tmatrices in a reversed order.\n"];
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.imin = 1;
    testData.imax = 9;
    return;
end % if

if testNumber == 3
    % setting up data for test1:
    testData.description = [
    "\tThis test is responsible for examining the correctness of\n", ...
    "\tsolving a system of linear equations in a form of: Ax = b\n", ...
    "\tfor the case when A is a tridiagonal, symmetric and real matrix\n", ...
    "\tand b is a column vector. The system of equations is solved by\n", ...
    "\ttransforming the matrix A into an upper-triangular form using\n", ...
    "\tHouseholder reflections. Then backward substitution is performed.\n", ...
    "\tIn each test case, the following are displayed: the system of\n", ...
    "\tequations to be solved, that is the matrix A, the column\n", ...
    "\tvector b, the solution x (obtained by using transform2diag and\n", ...
    "\tbacksubs3diag) and a norm ||Ax - b|| expressed as a multiple\n", ...
    "\tof epsilons.\n"];
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.imin = 1;
    testData.imax = 9;
    return;
end % if

end % function