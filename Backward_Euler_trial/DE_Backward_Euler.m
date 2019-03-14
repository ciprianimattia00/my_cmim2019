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

a = 0;
b = 1;
n = 100;
h = (b-a)/n;

y(1) = 0;
x(1) = X_0;

i = 0;

for j = a:h:b-h
    i = i+1;
    x(i+1) = x(i) + h;
    % forward Euler Method : y(n+1) = y(n) + h*f(x(n),y(n))
    ye = y(i) + h*Fun(x(i),y(i));
    yfe(i) = ye;
    % Backward Euler Method : y(n+1) = y(n) + h*f(x(n+1),y(n+1))
    y(i+1) = y(i) + h*Fun(x(i+1),ye); 
    ybe(i) = y(i);
    yex(i) = fex(j);
end

plot(x(1:100),yfe,x(1:100),ybe,x(1:100),yex);
legend('forward euler','backward euler','exact solution');
grid on