function M = randi3diag(n, imin, imax)

x = randi([imin, imax], 1, n);
y = randi([imin, imax], 1, n-1);
M = generate3diag(x, y);

end % function