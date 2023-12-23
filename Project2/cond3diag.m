function res = cond3diag(x, y, tol, iter)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Calculating the condition number of the tridiagonal, symmetric and real
% matrix, which is stored in vectors x and y. The conditional number is
% defined as the absolute value of the quotient of the eigenvalue returned 
% by the power method and the eigenvalue returned by the inverse power
% method. For the implementation of the inverse power method Householder
% reflections are being used. Thanks to the efficient matrix storage,
% computations for huge matrices (e.g. size of 200 000) are possible. 
% INPUT:
% x    - vector containing elements on the main diagonal of the matrix.
% y    - vector containing elements on the subdiagonal of the matrix.
%        It has one element less than vector x. Since the matrix is
%        symmetric, y is also equal to the supradiagonal.
% tol  - optional parameter determining the tolerance for the stop 
%        condition. If tol is a scalar, it is preset for both the power
%        method and the inverse power method. If it is a 2-element vector,
%        the first element of the vector is set to be the tolerance of the 
%        power method and the second element is set to be the tolerance of
%        the inverse power method. The default value for tol is 1e-10.
% iter - optional parameter determining the maximum number of
%        iterations. If iter is a scalar, it is preset for both
%        the power method and the inverse power method. If it is a
%        2-element vector, the first element of the vector is set to
%        be the maximum number of iterations of the power method and
%        the second element is set to be the maximum number of
%        iterations of the inverse power method. The default value
%        for iter is 1000.
% OUTPUT:
% res  - structure with the following fields:
%        res.cond - condition number defined as a absolute value of the 
%        quotient of the eigenvalue returned from the power method and the
%        eigenvalue returned by the inverse power method 
%        res.power.eigenvalue - eigenvalue returned by the inverse power
%        method
%        res.power.iterations - number of the iterations performed by the
%        algorithm
%        res.power.last_eigenvector_change - the value of the norm 
%        evaluated for the stop condition in the last iteration 
%        of the power method
%        res.inverse.eigenvalue - analogous to res.power.eigenvalue
%        res.inverse.iterations - analogous to res.power.iterations
%        res.inverse.last_eigenvector_change - analogous to 
%        res.power.last_eigenvector_change

if nargin < 4; iter = [1000, 1000];
elseif length(iter) == 1; iter = [iter, iter];
end
if nargin < 3; tol = [1e-10, 1e-10];
elseif length(tol) == 1; tol = [tol, tol];
end

power = power3diag(x, y, tol(1), iter(1));
inverse = inverse3diag(x, y, tol(2), iter(2));

condition_number = power.eigenvalue / inverse.eigenvalue;
res = struct('power', power, ...
                'inverse', inverse, ...
                'cond', condition_number);
end % function