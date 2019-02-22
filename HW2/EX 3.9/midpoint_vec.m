% Function that compute the integral using the midpoint method in vectorized version

function result_integration = midpoint_vec(f, a, b, n)

    h = (b-a)/n;
    x = linspace(a + h/2, b - h/2, n);
    result_integration = h*sum(f(x));
    
end