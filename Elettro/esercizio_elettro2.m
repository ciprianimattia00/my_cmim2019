
lambda = 550e-09; % [m]
h = 6.626069573e-34; % [J*s]
c = 2.99792458e+08; % [m/s]
kb = 1.38064852e-23; % [J/K]
T = 6000; % [K]
omega = 68e-6; % [sr]

L_BB1 = (2*h*c^2)/((lambda^5)*10^9*(exp((h*c)/(lambda*kb*T))-1)); % [W/m^2/nm/sr]

I_BB1 = L_BB1*omega*100; 

fprintf('\nL_BB1 = %d', L_BB1);
fprintf('\n\nI_BB1 = %d\n', I_BB1)

lambda = 1050e-09; % [m]

L_BB2 = (2*h*c^2)/((lambda^5)*10^9*(exp((h*c)/(lambda*kb*T))-1));

I_BB2 = L_BB2*omega*100; 

fprintf('\nL_BB2 = %d', L_BB2);
fprintf('\n\nI_BB2 = %d\n', I_BB2)

h2 = 4.135667516e-15;
E = h2*c/(1100e-9);
fprintf('\n\nE = %d\n', E);