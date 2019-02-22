% function for the calculation of integrals using the trapezoidal methode
% that consist of dividing the domain of the function (from a to b) in n equal parts.

function integral = trapezoidal(f, a, b, n)

%function to compute approximation of integrals using composite
%trapezoidal methode

const1 = f(a)/2;
const2 = f(b)/2;
h = (b-a)/n; % lenght of every singol interval in the domain of the function
integral = (const1 + const2); % starting point for the for loop

% for loop for calculating the integral
for ii = 1:n-1
  
    integral = integral +f(a + ii*h);
    
end

integral = h*integral;

end