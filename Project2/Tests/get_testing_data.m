function [testData] = get_testing_data(testNumber)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% The sole purpose of this function is setting up data
% for testing functions from 1 to 6.

if ~ismember(testNumber, 1:9)
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
    % setting up data for test2:
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
    % setting up data for test3:
    testData.description = [
    "\tThis test is responsible for examining the correctness of\n", ...
    "\tsolving a system of linear equations in a form of: Ax = b\n", ...
    "\tfor the case when A is a tridiagonal, symmetric and real matrix\n", ...
    "\tand b is a column vector. The system of equations is solved by\n", ...
    "\ttransforming the matrix A into an upper-triangular form using\n", ...
    "\tHouseholder reflections. Then backward substitution is performed.\n", ...
    "\tIn each test case, the following are displayed: the system of\n", ...
    "\tequations to be solved, that is - the matrix A, the column\n", ...
    "\tvector b and the solution x (obtained by using transform2diag and\n", ...
    "\tbacksubs3diag). The correctnes of the solution is checked by\n", ...
    "\tevaluating a norm ||Ax - b|| and displaying it as a multiple\n", ...
    "\tof epsilons.\n"];
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.imin = 1;
    testData.imax = 9;
    return;
end % if

if testNumber == 4
    % setting up data for test4:
    testData.description = [
    "\tThis test is responsible for examining the accuracy of\n", ...
    "\tevaluation of the condition number for the case when the\n", ...
    "\tconsidered matrix is tridiagonal, symmetric and real.\n", ...
    "\tIn addition, matrix in each test case is a Teoplitz matrix, thus\n", ...
    "\tits eigenvalues can be determined using an explicit formula.\n", ...
    "\tThe formula, with a proper proof and explanation can be found here:\n", ...
    "\thttps://hal.science/hal-01461924/file/KST.pdf\n", ...
    "\tIn each test case, the following are displayed:\n", ...
    "\tthe tested matrix A, expected and actual eigenvalues found by\n", ...
    "\tthe power method and the inverse power method and expected as\n", ...
    "\twell as actual condition number. Expected and actual values\n", ...
    "\tare compared by evalutaing the absolute error expressed\n", ...
    "\tas a multiple of epsilon.\n"];
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.imin = 1;
    testData.imax = 9;
    return;
end % if

if testNumber == 5
    % setting up data for test5:
    testData.description = [
    "\tThis test is responsible for examining the correctness of\n", ...
    "\tmemory-efficient matrix storage. The programme should be able to\n", ...
    "\tperform calculations for huge matrices (e.g. size of 200 000).\n", ...
    "\tThe matrix in each test case was generated using Givens rotations,\n", ...
    "\twhich allowed to create tridiagonal, symmetric and real matrices\n", ...
    "\twith specified eigenvalues. Since the computation time for such\n", ...
    "\thuge matrices is long, the eigenvalues were chosen in such a way\n", ...
    "\tso as to enhance the speed of convergencr of the eigenvalue\n", ...
    "\talgorithms (power method and inverse power method).\n", ...
    "\tThe maximum number of iterations was also limited.\n", ...
    "\tIn each test case 3 tables are displayed:\n", ...
    "\tThe first column of each table is an expected value, the second\n", ...
    "\tcolumn is an actual value and the last column is:\n", ...
    "\t- power.last_eigenvector_change/eps for the first table\n", ...
    "\t- inverse.last_eigenvector_change/eps for the second table\n", ...
    "\t- abs(Expected - Actual)/eps for the third table\n"];
    testData.n = 2e5;
    testData.eigs = {[1e2, linspace(1e3, 1e5, 2e5 - 2), 1e6]};
    testData.tol = {1e-14};
    testData.iter = {[100, 20]};
    testData.numOfTestCases = length(testData.n);
    return;
end % if

if testNumber == 6
    % setting up data for test6:
    testData.description = [
    "\tThis test is responsible for examining the speed of convergence\n", ...
    "\tof power method for the case when the considered matrix is \n", ...
    "\ttridiagonal, symmetric and real. In addition, matrix in each test\n", ...
    "\tcase is a Teoplitz matrix, thus its eigenvalues can be determined\n", ...
    "\tusing an explicit formula.\n", ...
    "\tThe formula, with a proper proof and explanation can be found here:\n", ...
    "\thttps://hal.science/hal-01461924/file/KST.pdf\n", ...
    "\tSince the error of the algorithm is exponential, it forms a straight\n", ...
    "\tline when presented on a logarithmic scale (on the Y-axis).\n", ...
    "\tThe slope of the line is evaluated based on the\n", ...
    "\tlast_eigenvalue_change returned by power3diag function.\n", ...
    "\tThen simple linear regression is applied on a vector of errors to\n", ...
    "\tfind the slope of the line. On the other side, it is known that the\n", ...
    "\tspeed of convergence of the power method depends on an absolute\n", ...
    "\tvalue of the quotient of proper eigenvalues.\n", ...
    "\tIn each test case, the following are displayed:\n", ...
    "\tthe tested matrix A, an expected slope of the error when plotted\n", ...
    "\tin a semilogy way and an actual slope of the error evaluated based\n", ...
    "\ton power3diag and the aforementioned linear regression.\n"];
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.a = [2, 4, 7, 5, 7];
    testData.b = [5, 6, 8, 3, 6];
    testData.iter = [40, 40, 60, 150, 150];
end % if

if testNumber == 7
    % setting up data for test7:
    testData.description = [
    "\tThis test is responsible for examining the speed of convergence\n", ...
    "\tof inverse power method for the case when the considered matrix is\n", ...
    "\ttridiagonal, symmetric and real. In addition, matrix in each test\n", ...
    "\tcase is a Teoplitz matrix, thus its eigenvalues can be determined\n", ...
    "\tusing an explicit formula.\n", ...
    "\tThe formula, with a proper proof and explanation can be found here:\n", ...
    "\thttps://hal.science/hal-01461924/file/KST.pdf\n", ...
    "\tSince the error of the algorithm is exponential, it forms a straight\n", ...
    "\tline when presented on a logarithmic scale (on the Y-axis).\n", ...
    "\tThe slope of the line is evaluated based on the\n", ...
    "\tlast_eigenvalue_change returned by inverse3diag function.\n", ...
    "\tThen simple linear regression is applied on a vector of errors to\n", ...
    "\tfind the slope of the line. On the other side, it is known that the\n", ...
    "\tspeed of convergence of the inverse power method depends on an\n", ...
    "\tabsolute value of the quotient of proper eigenvalues.\n", ...
    "\tIn each test case, the following are displayed:\n", ...
    "\tthe tested matrix A, an expected slope of the error when plotted\n", ...
    "\tin a semilogy way and an actual slope of the error evaluated based\n", ...
    "\ton inverse3diag and the aforementioned linear regression.\n"];
    testData.n = [2, 3, 4, 8, 10];
    testData.numOfTestCases = length(testData.n);
    testData.a = [2, 9, 7, 5, 7];
    testData.b = [5, 1, 8, 3, 6];
    testData.iter = [40, 60, 30, 50, 40];
end % if

if testNumber == 8
    % setting up data for test8:
    testData.description = [
    "\tThis test is responsible for examining the correctness of the\n", ...
    "\timplementation of the power method in terms of achieving the\n", ...
    "\tspecified accuracy of the dominant eigenvalue approximation.\n", ...
    "\tIn each test case, the following are displayed:\n", ...
    "\ta tested matrix (that is tridiagonal, symmetric and real),\n", ...
    "\ta table whose first column contains the expected order of\n", ...
    "\tmagnitude of the approximation error, the second column\n", ...
    "\tcontains the actual value of the norm indicating the error,\n", ...
    "\twhich is: ||Av - λv|| and the third column contains the number\n", ...
    "\tof iterations that the algorithm required to achieve the assumed\n", ...
    "\taccuracy. The test matrices include Wilkinson matrices, for which\n", ...
    "\twe expect the power method to converge slowly.\n"];
    testData.A = {wilkinson(3), wilkinson(4), wilkinson(10)};
    testData.names = ["wilkinson(3)", "wilkinson(4)", "wilkinson(10)"];
    testData.numOfTestCases = length(testData.A);
    testData.tol = 10.^(-1:-1:-15);
    testData.iter = 1e6;
end % if

if testNumber == 9
    % setting up data for test9:
    testData.description = [
    "\tThis test is responsible for examining the correctness of the\n", ...
    "\timplementation of the inverse power method in terms of achieving\n", ...
    "\tthe specified accuracy of approximation of the eigenvalue with\n", ...
    "\tthe least absolute value. In each test case, the following are\n", ...
    "\tdisplayed: a tested matrix (that is tridiagonal, symmetric\n", ...
    "\tand real), a table whose first column contains the expected order\n", ...
    "\tof magnitude of the approximation error, the second column\n", ...
    "\tcontains the actual value of the norm indicating the error,\n", ...
    "\twhich is: ||Av - λv|| and the third column contains the number\n", ...
    "\tof iterations that the algorithm required to achieve the assumed\n", ...
    "\taccuracy. The test matrices include Wilkinson matrices, for which\n", ...
    "\twe expect the inverse power method to converge slowly.\n"];
    testData.A = {wilkinson(3), wilkinson(4), wilkinson(10)};
    testData.names = ["wilkinson(3)", "wilkinson(4)", "wilkinson(10)"];
    testData.numOfTestCases = length(testData.A);
    testData.tol = 10.^(-1:-1:-15);
    testData.iter = 1e6;
end % if

end % function