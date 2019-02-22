% Mattia Cipriani Assignment 2, exercise 3.9
% script for running all the function and obtaine the plots

f = @(x) x.^2; % first function
g = @(x) sqrt(x); % second function
a = 0; % down boundery integral
b = 2; % upper boudnery integral
epsilon1 = 1e-1; % error used for computing adaptive integration for the first function 
epsilon2 = 1e-10; % error used for computing adaptive integration for the second function

% b)
method = 'trapezoidal';
adaptive_integration (f, a, b, epsilon1, method);
adaptive_integration (g, a, b, epsilon2, method);


% c)
epsilon = 1*10.^-(linspace(1,10,10));
% run the function with midpoint methode and plot it
method = 'midpoint';
n_values1 = adaptive_integration (g, a, b, epsilon, method);

% run the function with trapezoidal methode and plot it
method = 'trapezoidal';
n_values2 = adaptive_integration (g, a, b, epsilon, method);

% plot both n_values vector for midpoint and trapezoidal methods
semilogx(epsilon, n_values1, epsilon, n_values2);
xlabel('epsilon');
ylabel('2n');
legend('midpoint','trapezoidal');
