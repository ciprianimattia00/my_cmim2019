%% test integrate coefficient

% setting f = 1, compute integration function will work with bn = @(t)
% 1/pi.*(1*sin(i.*t)), computing the value of the integral of sin(nt) that
% should be equal to zero if it is computed between -pi and pi.
% the function needs to work with a for loop for computing all the values in the 
% array bn_values, otherwise the test fails 

f = @(t) 1; 
N = 5; 
M = 100;

expected = 0; % the expected value of the integral should be zero
bn_values = integrate_coefficient(f, N, M);

% for cycle fo computing the test for all the value of b calculated by the
% intetrate coefficient function
for i = 1:N

    diff = abs(expected - bn_values(i));
    tol = eps*10;
    assert(diff < tol, '%f < %f, test succesfully passed' , diff, tol);

end
