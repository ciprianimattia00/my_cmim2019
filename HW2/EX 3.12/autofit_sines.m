% Mattia Cipriani Assignment 2, exercise 3.12
% script for running the main function integrate _coeffient and plot the
% results.

N = 100; % number of 
M = 100; % number of intervals for numerical integration
filename = 'autofit sines with f(t)=exp(-(t-pi)) and N = 100'; 
% two function, you can choose one of them commenting the other one 
%f = @(t) t./pi;  
f = @(t) exp(-(t-pi));

bn_values = integrate_coefficient(f, N, M); 
fprintf('bn_values = ');
disp(bn_values);
plot_approx(f, N, M, filename);