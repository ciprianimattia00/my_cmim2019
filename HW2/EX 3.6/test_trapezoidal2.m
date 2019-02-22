%% firs test trapezoidal 

f = @(x) 6*x - 4;
F = @(x) 3*x^2 - 4*x;
a = 1.2;
b = 4.4;
n = 2;

expected = F(b)-F(a); %40.9600;
computed = trapezoidal(f, a, b, n); % trapezoidal = 40.9600
diff = abs(expected - computed);
tol = eps(expected)*10;
assert(diff < tol, 'integration error larger than tol. Error = %g, tol = %g' , diff, tol);

%% second test trapezoidal 

f = @(x) 6*10^(8)*x - 4*10^6; 
F = @(x) 3*10^(8)*x^2 - 4*10^6*x; 

a = 1.2; % down boundery of integral
b = 4.4; % up boudery of integral
n = 2; % number of intervals


expected = F(b)-F(a); % expected = 5.3632e+09

computed = trapezoidal(f, a, b, n); % trapezoidal = 5.3632e+09 

diff = abs(expected - computed); % diff = 9.5367e-07

tol = eps(expected)*10; % eps(expected)*10 = 9.5367e-06   

% assert = command from MATLAB for checking the rsults in runtests :
% assert(condition, output message if the condition is not satisfied)
assert(diff < tol, 'integration error larger than tol. \nError = %g, tol = %g' , diff, tol); 


