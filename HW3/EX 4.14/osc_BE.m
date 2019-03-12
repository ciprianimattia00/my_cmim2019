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
% the following 2 lines allows the user to decide the number of steps per
% period in order to determine the dt. (the exercise ask for 20 and 2000)
steps_per_period = input('steps per period = ');
spp = steps_per_period;
dt = T0/spp;
tk = 3*T0; % 3 succesive periods in the plot

N_t = floor(tk/dt); % floor is rounding the fraction in case it is not an integer
t = linspace(0, N_t*dt, N_t+1);
% definition of two zero vectors for position and velocity
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
title(sprintf('Displacements BE spp = %g, dt = %g, tk = %f', spp, dt, tk))
xlabel('t');
% print the plot obtained in two files
print('tmp', '-dpdf'); 
print('tmp', '-dpng');

