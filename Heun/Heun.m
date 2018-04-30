function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%Heun finds the numerical solution to a differential equation, given a
%function, a span of values, an initial condition, and a step size.
%
% Inputs:
%    dydt   -   The differential equation input. This works best using
%               anonymous functions instead of MATLAB's smbolic equation 
%               toolbox.
%   tspan   -   A span of values the differential equation will be
%               evaluated over. Input using a vector 
%               [(starting number) (stopping number)]
%     y0    -   The initial condition, where y0 is the value of dydt at 
%               tspan(1)
%     h     -   The step size.
%     es    -   The stopping error value. Defaults to .001
%   maxit   -   The maximum number of iteration that will be used.
%               Defaults to 50
% Outputs:
%     t     -   
%     y     - 

% Written by Erik Kvietkus on 4/27/2018
if nargin < 4
    error('The Heun function requires at LEAST 4 inputs.');    
elseif nargin < 5
    es = 0.001;
    maxit = 50;
elseif nargin < 6
    maxit = 50;
elseif nargin > 6
    error('The Heun function requires at MOST 6 inputs.');
end

t = tspan(1):h:tspan(2);    % Creates the t vector. Starts at tspan(1) increases by h until tspan(2)
[~,j] = size(t);            % Checks vector length of t
if t(j) ~= tspan(2)         % If the last vector in t is not the last value in tspan
    t(j+1) = tspan(2);      % Creates an extra t value on the end and makes it the last value of tspan
end
tdiff = diff(t);    % Calculates the difference between each t value. All values should be h except possibly the last one
y = zeros(1,j);     % Creates the y vector
y(1) = y0;          % Plugs in y0 to the first value of y

for i = 1:j     % Runs from 1 to the length of t
    slopeleft = dydt(t(i),y(i));    % Calculates the left slope estimate
    predictor = y(i) + tdiff(i)*dydt(t(i),y(i));    % Calculates the predictor
    sloperight = dydt((t(i)+tdiff(i)),predictor);   % Calcualtes the first right slope estimate
    y(i+1) = y(i) + (tdiff(i)/2)*(slopeleft + sloperight);  % Calculates the first y estimate
    iteration = 1;  % Starts iteration counter at 1
    err = 1;    % Sets a baseline error of 1
    while (err > es) && (iteration <= maxit)   % Iterates the y estimate while error is greater than es and while iteration is less than or equal to the maximum number of interations as defined by the user
        yold = y(i+1);  % Stores the previous y value so error can be calulated
        sloperight = dydt(predictor,y(i+1));    % Calculates slope right 
        y(i+1) = y(i) + (tdiff(i)/2)*(slopeleft + sloperight);  % Calcualtes the new y estimate with slope right and left
        err = abs((y(i+1)-yold)/y(i+1));    % Calculates error
        iteration = iteration +1;   % Adds one to the iteration counter
    end
end
plot(t,y)   % Plots the t and y vectors
xlabel('t'); ylabel('y'); title('Numerical Solution');  % Adds axis labels