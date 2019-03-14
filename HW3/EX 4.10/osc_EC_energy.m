% Mattia Cipriani Exercise 4.10
% Oscillating system solved with Euler Cromer Method and energy
% calcultaion 

omega0 = 2;

% Initial condition
X_0 = 2;

T0 = 2*pi/omega0; % Period of the function
dt = T0/20; % time step
tk = 3*T0; 

N_t = floor(tk/dt); % number of steps
t = linspace(0, N_t*dt, N_t+1);
% arrays for position and velocity
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Boundery condition
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    % Euler Cromer Method
    v(n+1) = v(n) - dt*omega0^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

% plot the solution of the Euler Cromer Methode, comparing it with the
% exact solution 
figure % save the figure
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(sprintf('Displacements EC dt %g, tk %f', dt, tk))
xlabel('t');

% calculate all the energies and plot all of them
% call the osc_energy function for computing energy
[E,Up,K] = osc_energy(u, v, omega0);

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