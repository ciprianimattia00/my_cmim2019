% Function for computng the value of potential and kinetic energy in 

function [E,Up,K] = osc_energy(u, v, omega0)

K = 0.5*v.^2;
Up = 0.5*omega0^2*u.^2;
E = K + Up;

end