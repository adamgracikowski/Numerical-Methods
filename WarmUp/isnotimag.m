function r = isnotimag(v)
% Zadanie R
% Adam Grącikowski, 327350
%
% Function used to generate a logical horizontal vector 
% indicating which elements of the input vector are real
% and which elements are imaginary
% Input:
%   v - horizontal vector
% Output:
%   r - logical vector

n = size(v, 2);
r = true(1, n);

for i = 1:n
    r(i) = isreal(v(i));
end % for

end % function