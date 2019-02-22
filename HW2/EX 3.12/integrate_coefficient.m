% function that works with the trapozoidal method function for giving in
% output a vector bn_values containing values of b for every value of the
% vector n, f.ex bn = [b1, b2, b3] with n = linspace(1,N,N) and N = 3

function bn_values = integrate_coefficient(f, N, M)

n = linspace(1,N,N); % vector n containing integer number from 1 to N for running the for loop 
bn = @(t) 1/pi.*(f(t)*sin(n.*t)); % function that has to be integrated 
a = -pi; % down boundery of the integral
b = pi; % upper boundery of the integral 

   for n = 1:N
       
        result_integration = trapezoidal(bn, a, b, M); % integration without vectorization
        
   end
   
   bn_values = result_integration; % output array of the function, containing all the value of
                                   % 'b' computed by the function 
end
