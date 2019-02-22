% trapezoidal method to compute the integrals

function integral = trapezoidal(f, a, b, n)

const1 = f(a)/2;
const2 = f(b)/2;
h = (b-a)/n;
integral = (const1 + const2);

for ii = 1:n-1
  
    integral = integral +f(a + ii*h);
    
end

integral = h*integral;

end