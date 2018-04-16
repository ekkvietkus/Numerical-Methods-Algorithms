function I = Simpson(x,y)
%Simpson numerically obtains the integral of the vector y with respect to
%vector x.
%
% Inputs:
%   x   -   A vector of the same size as y 
%   y   -   A vector of the same size as x
%
% Outputs:
%   I   -   The numerically calculated integral of y with respect to x.

% Written by Erik Kvietkus on 4/5/2018

if (nargin ~= 2) || (isvector(x) ~= 1) || (isvector(y) ~= 1)    % Checks if anything but two arguments have been  used, or if x or y are not vectors.
    error('This function requres an input of two same sized vectors.');
end
[~,j] = size(x);    % Evaluates the size of x. Discards first value.
[~,k] = size(y);    % Evaluates the size of y. Discards first value.
if j ~= k
    error('This function requres two vector inputs of the same length.');
end
xspace = diff(x);   % Returns the difference between each value of x
xmin = min(xspace); % Returns the min value of xspace
xmax = max(xspace); % Returns the max value of xspace
if (abs(xmax - xmin)) >= .000001 % Checks that x is equally spaced. Accounts for subtractive cancellation.
    error('The x function MUST be equally spaced.');
end
if rem(j,2) == 1   % Divides j (the vector size of x) by two. If there is a remainder the value was odd.
    % simps on n-1, trap on last
    warning('This requires the use of the trapeziod rule. Results may be less accurate.');
    oddsum = 0;
    for count1 = 3:2:(j-3)  % Calculates the sum of all non 1 odd values on y
        oddsum = oddsum + y(1,count1);
    end
    evensum = 0;
    for count2 = 2:2:(j-1)  % Calculates the sum of all non j even values on y
        evensum = evensum + y(1,count2);
    end
    n = j - 2;
    I = (x(1,j)-x(1,1))*((y(1,1)+(4*oddsum)+(2*evensum)+y(1,k))/(3*n)); % Calculates the numerical integral using Simpson's 1/3 composite rule
    I = I + (x(1,j)-x(1,(j-1)))*((y(1,k)+y(1,(k-1)))/2);    % Adds the trapeziod from the last interval
elseif rem(j,2) == 0    % Divides j (the vector size of x) by two. If there is a remainder the value was odd.
    if j > 2    % composite simpson's 1/3
        oddsum = 0;
        for count3 = 3:2:(j-1)  % Calculates the sum of all non 1 odd values on y
            oddsum = oddsum + y(1,count3);
        end
        evensum = 0;
        for count4 = 2:2:(j-2)  % Calculates the sum of all non j even values on y
            evensum = evensum + y(1,count4);
        end
        n = j - 1; 
        I = (x(1,j)-x(1,1))*((y(1,1)+(4*oddsum)+(2*evensum)+y(1,k))/(3*n)); % Calculates the numerical integral using Simpson's 1/3 composite rule
    elseif j <= 2   % Trapezoid rule
        warning('This requires the use of the trapeziod rule. The Simpsons 1/3 rule cannot be applied to a vector of length 2. Results may be less accurate.');
        I = (x(1,j)-x(1,1))*((y(1,k)+y(1,1))/2);    % Uses trapeziod rule to calculate numerical integral.
    end
else
    error('The Function has encountered a fatal error. "Insert Microsoft blue-screen joke"');   % In case the number somehow isn't odd or even...
end