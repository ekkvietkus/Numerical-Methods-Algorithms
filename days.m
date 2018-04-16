function [nd] = days(mo, da, leap)
%days Calculates the number of elapsed days in a year given the month, day,
%and whether it is a leap year. 
% Inputs:
%   mo      Month (1-12)
%   da      Days  (1-31) 
%   leap    Is it a leap year? (1 = yes, 0 = no(default))
tic
if nargin < 2 || nargin > 3 % Checks the number of arguments input
    error('Please consult the help function')
elseif nargin == 2  
    leap = 0;   % If only 2 arguments used, it is assumed it is not a leap year
end
if (mo > 12) || (da > 31)   % Checks if the user input makes sense
    error('Please enter a valid date format (month, day)')
end

if leap == 0    % daysum is the sum of days from the previous months
    daysum = [0,31,59,90,120,151,181,212,243,273,304,334,365];
else
    daysum = [0,31,60,91,121,152,182,213,244,274,305,335,366];
end
nd = daysum(mo) + da;   % Calculates the number of days by adding the sum of the days from the previous month to the number of days in the current month
toc