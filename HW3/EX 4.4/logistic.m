% Mattia Cipriani Exercise 4.4
% Compute the numerical solution of the logistic equation for a set of repeatedly
% halved time steps:Compute the numerical solution of the logistic equation for 
% a set of repeatedly halved time steps: dtk = 2^(-k)*dt, K = 1,2,3...;
% plotting the last two solution.

% initial parameters and inputs for the ode_FE function
M = 500;
r = 0.1; 
f = @(u, t) r*(1 - u/M)*u; 
U_0 = 100; 
T = 60;
N = 20;
dt = 20; % time steps

condition = true;

while condition == true
  
    for k = 0:N
          
          % close the graph obtained with the previuos iteration
          close all;
       
          % halved time step
          dtk = 2^(-k)*dt;  
          dtk2 = 2^(-(k-1))*dt;
          
          %call the ode_FE function
          [u1, t1] = ode_FE(f, U_0, dtk, T); % Forward Euler method 
          [u2, t2] = ode_FE(f, U_0, dtk2, T); % Forward Euler method 
          
          % plot the two curves
          plot(t1,u1,'r-',t2,u2,'b-');
          xlabel('t');
          ylabel('N(t)');
          legend('dt(k)','dt(k-1)');
          
          % ask to the user if the graphs are good or if it is better to
          % continue the loop
          fprintf('\ndt(k) = %d, dt(k-1) = %d \n', dtk, dtk2);
          fprintf('Do you want to continue the loop and obtaine more precise graphs? \n');
          question = input('1 = YES, 0 = N0, type = ');
          
          % break the cycle if the user answer NO
          if question == 0
              break;
          end
    end
    
    condition = false;
    
end

