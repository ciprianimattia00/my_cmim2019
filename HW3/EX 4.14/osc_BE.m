% Mattia Cipriani Exercise 4.14
% osc_BE solves the problem of the simple oscillator using first order
% Backward Euler Method.

clc
clear all
close all

omega0 = 2;

% Initial condition
X_0 = 2;
T0 = 2*pi/omega0; 
dt = T0/20;
tk = 3*T0;

N_t = floor(tk/dt); % floor is rounding the fraction in case it is not an integer
t = linspace(0, N_t*dt, N_t+1);


u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% boudery conditions 
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t 
    % Backward Euler Method : y(n+1) = y(n) + h*f(x(n+1),y(n+1))
    % the implicit methods requiere a fixed-poit iteration
    u(n+1) = u(n) - dt*v(n);
    v(n+1) = v(n) + dt*omega0^2*u(n+1);
    u(n+1) = u(n) - dt*v(n+1);
end

% plot numerical solution(Backward Euler Method) and exact solution
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('Backwards Euler Method', 'Exact');
title(sprintf('Displacements BE dt %g, tk %f', dt, tk))
xlabel('t');
