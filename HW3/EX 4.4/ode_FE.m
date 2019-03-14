% function for the class of differential
% equation problems of the form u'(t) = f(u,t) with u = U_0 and 0<=t<=T


function [sol, time] = ode_FE(f, U_0, dt, T)

    N_t = floor(T/dt);
    u = zeros(N_t+1, 1);
    t = linspace(0, N_t*dt, length(u));
    u(1) = U_0;
    
        for n = 1:N_t
            u(n+1) = u(n) + dt*f(u(n), t(n));
        end
        
    sol = u;
    time = t;
    
end


