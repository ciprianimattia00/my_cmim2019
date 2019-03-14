% N_0 = input('Give initial population size N_0: ');
% r   = input('Give net growth rate r: ');
% dt  = input('Give time step size: ');
% N_t = input('Give number of steps: ');
N_0 = 100;
r   = 0.1;
dt  = 0.5;
N_t = 40;
t = linspace(0, N_t*dt, N_t+1);
N = zeros(N_t+1, 1);

N(1) = N_0;
for n = 1:N_t
    N(n+1) = N(n) + r*dt*N(n);
end

if N_t < 70
    numerical_sol = 'bo';
else
    numerical_sol = 'b-';
end
plot(t, N, numerical_sol, t, N_0*exp(r.*t), 'r-');
xlabel('t'); ylabel('N(t)');
legend('numerical', 'exact', 'location', 'northwest');
filestem = strcat('growth1_', num2str(N_t), 'steps');
print(filestem, '-dpng'); 
print(filestem, '-dpdf');