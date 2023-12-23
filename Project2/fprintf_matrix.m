function [] = fprintf_matrix(matrix, fieldWidth, decimalPlaces)
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Displays a matrix in a formatted manner using fprintf function. The
% function also works correctly with vectors and scalars.
% INPUT:
% matrix         - matrix to be displayed on console.
% field_width    - a parameter for fprintf determining the width 
%                  of the field for one element of the displayed matrix
% decimal_places - a parameter for fprintf determining the number of
%                  decimal places for one element of the displayed matrix

[rows, cols] = size(matrix);
formatString = ['% ', num2str(fieldWidth), '.', ...
    num2str(decimalPlaces), 'f '];

for i = 1:rows
    for j = 1:cols
        fprintf(formatString, matrix(i, j));
    end % for
    fprintf('\n');
end % for

end % function