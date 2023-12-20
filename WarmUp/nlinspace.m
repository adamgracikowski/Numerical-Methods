function v = nlinspace(a, b, n, p)
% Zadanie R
% Adam Grącikowski, 327350
%
% Function used to generate a sequence of n numbers 
% which are logarithmically spaced between p^a and p^b
% Input:
%   a - exponent of the left verge of the generated interval
%   b - exponent of the right verge of the generated interval
%   n - number of points
%   p - base of the power
% Output:
%   v - horizontal vector of generated values

lnp = log(p);
v = exp(lnp*linspace(a, b, n));

end % function