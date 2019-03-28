m = 1;
omega0 = 2;
kk = omega0^2*m;

% Initial condition
X_0 = 2;

T0 = 2*pi/omega0; % Period of the function
dt = T0/2000; % time step
tk = 3*T0; 
N_t = floor(tk/dt); % number of steps
t = linspace(0, N_t*dt, N_t+1);

u = X_0*cos(omega0*t);
v = -2*X_0*sin(omega0*t);
figure;
plot(t,u);

% Kinetic Energy
K = 0.5*m*v.^2; 
% Potential Energy
Up = 0.5*kk*u.^2;
% Total Energy
E = K + Up;

% calculate all the energies and plot all of them
% call the osc_energy function for computing energy
% plot Potential and Kinetic Energy in the same plot
figure
plot(t,Up,'r-',t,K,'g-');
xlabel('t');
ylabel('Energy');
legend('Potential Energy','Kinetic Energy');
% plot Total Energy
figure
plot(t, E,'b-');
xlabel('t');
ylabel('Total Energy');
title('Total Energy = Potential Energy + Kinetic Energy');
