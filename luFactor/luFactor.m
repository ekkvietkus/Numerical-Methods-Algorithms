function [L,U,P] = luFactor(A)
%luFactor calcualtes the lower, upper, and permutation matrix from an input
%matrix. By using [L,U,P] = luFactor(A)all three values can be obtained.
%
% Inputs:
%    A  -   the input matrix
%
% Outputs:
%   L   -   the lower triangluar matrix
%   U   -   the upper triangular matrix
%   P   -   the permutation matrix

% Written by Erik Kvietkus on 3/24/2018

if nargin > 1   % Check if more than one input given
    error('This function only accepts one input matrix')    % Produce error if more than one input
end

[m,n] = size(A);        % Checks the size of the matrix (m is rows n is columns) 
if (m == 1) || (n == 1) % Checks if m or n is equal to 1 (A would be a vector)
    error('This function requires a matrix input, not a vector') 
elseif m ~= n           % Checks that the matrix A is actually a square
    error('This function requires a square matrix input') 
end

L = eye(m); % Starts the L matrix as a row of 1s diagonally
U = A;      % Starts the U matrix as the A input matrix 
P = eye(m); % Starts the P matrix as a row of 1s diagonally

% Pivoting
for i = 1:m    % Creates a for loop that runs from i = 1 to m
    col = U((i:m),:);   % Sets column equal to the ith column of U 
    [~,h] = max(abs(col),[],1); % This calculates the absolute max value in each column. h stores which column it came from for reference. The g (now ~) vector would have stored the actual largest values, but this is irrelevant so the use of ~ doesn't store it
    U([h(i)+i-1 i],:) = U([i h(i)+i-1],:);  % Pivots the U matrix. Creates a 2 by 3 matrix that contains the two rows that is swapping to pivot. 
    P([h(i)+i-1 i],:) = P([i h(i)+i-1],:);  % Pivots the P matrix. Creates a 2 by 3 matrix that contains the two rows that is swapping to pivot.
    if i > 1
        for x = 1:(i-1) % Runs from 1 to i-1 (it won't run on the first iteration (no reason to permutate L))
            L([h(i)+i-1 i],x) = L([i h(i)+i-1],x);  % Canges the L matrix according to previous permutations
        end
    end
% Elimination
    for z = 1:(m-i) 
        L(i+z,i) = U(i+z,i)/U(i,i); % Calcualtes the a/b value, stores it in the correct location in L
        U(i+z,:) = U(i+z,:) - U(i,:)*U(i+z,i)/U(i,i);  % Preforms elimination a row at at time. Pulls the corresponding L value from the L matrix to do so.
    end
end