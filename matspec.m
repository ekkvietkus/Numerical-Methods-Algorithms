function [matOut] = matspec(n,m)
%matspec This function creates a n(row) by m(column) matrix.
%   Inputs:
%       n - number of rows
%       m - number of columns
%   Outpus:
%       matOut - the n by m matrix 
if nargin ~= 2 % Checks the number of arguments input
    error('This function requires two inputs.')
end
matOut = zeros(n,m);    % Preallocates memory
for k = 1:n
    for h = 1:m
      if k == 1 
          matOut(k,h) = h;  % Sets the first row equal to the column number
      elseif h == 1
          matOut(k,h) = k;  % Sets the first column equal to the row number
      else
        matOut(k,h) = matOut(k,h-1) + matOut(k-1,h);    % Sets space (n,m) to the sum of the the number left and the number above it
      end
    end
end

