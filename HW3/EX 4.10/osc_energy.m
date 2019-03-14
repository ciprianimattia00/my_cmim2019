% Function for computng the value of potential, kinetic and total energy in
% an oscillating system, assuming potential energy Up = 1/2*w^2*u^2 and
% kinetic energy K = 1/2*v^2

function [E,Up,K] = osc_energy(u, v, omega0)

% Kinetic Energy
K = 0.5*v.^2; 
% Potential Energy
Up = 0.5*omega0^2*u.^2;
% Total Energy
E = K + Up;

end