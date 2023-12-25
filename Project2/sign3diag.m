function Y = sign3diag(x)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Returns an array Y the same size as x, where each element of Y is:
% 1 if the corresponding element of x is >= 0.
% -1 if the corresponding element of x is < 0.

Y = sign(x);
Y(Y == 0) = 1;

end % function