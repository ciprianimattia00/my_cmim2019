% Mattia Cipriani Assignment 2, exercise 3.6
% script for running the convergence rates test.

f = @(x) 6*10^(8)*x - 4*10^6; % function
F = @(x) 3*10^(8)*x^2 - 4*10^6*x; %Antiderivative 

a = 1.2; % down boundery of integral
b = 4.4; % up boudery of integral


% the following three lines are used for running the convergence rates
% methode 
num_experiments = 10;
r = convergence_rates(f, F, a, b, num_experiments);
disp (r);