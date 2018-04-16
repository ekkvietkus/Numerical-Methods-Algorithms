function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition calulates the root of any function given four parameters
%
% Inputs:
%   func    -   the evaluated function
%   xl      -   the lower bound
%   xu      -   the upper bound
%   ex      -   the desired relative error in percent (default is 0.0001%)
%   maxiter -   the max number of iterations preformed (defualt is 200)
%
% Outputs:
%   root    -   the estimated x value of the root
%   fx      -   the funciton evaluated at the location of the root
%   ea      -   the approximate relative error in percentage 
%   iter    -   the number of iterations preformed 

format long     % makes matlab display more digits

% This section removes idiotic inputs and will call the user an idiot if
% needed. Also sets defaults if es and maxiter are not entered
if nargin == 4
    maxiter = 200;
elseif nargin == 3
    es = 0.0001;
    maxiter = 200; 
elseif (nargin < 3) || (nargin > 5)
    error('You are an idiot')
end

% Checks that the initial brackets bracket the root
if (func(xl) * func(xu)) > 0
    error('You are an idiot, no root is bounded');
end

xr = xl;    % sets xr equal to xl
for iter = 1:maxiter    % creates variable iter that runs from 1 to maxiter
    prv = xr;   % stores the previous xr value before changing it
    xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))); % new xr calclulated with false position formula 
    if (func(xr) * func(xu)) < 0    % if and elseif statements check with side of the xr the root is on
        xl = xr;
    elseif (func(xr) * func(xl)) < 0
        xu = xr;
%     elseif func(xr) == 0    % Checks if the exact answer has been achieved
%         break
    end
    if (abs((xr - prv) / xr) * 100) <= es   % checks when to stop the loop, given that the approximate error is less than or equal to the accepted error
        break
    end
end

% Creates output variables
root = double(xr); % converts from symbolic to double
fx = double(func(xr));  % converts from symbolic to double
ea = double(abs((xr - prv) / (xr)) * 100);  % converts from symbolic to double
iter = double(iter);    % converts from symbolic to double

% Display variables
display(root);
display(fx);
display(ea);
display(iter);