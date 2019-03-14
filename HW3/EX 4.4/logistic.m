% Mattia Cipriani Exercise 4.4
% 

% initial parameters and inputs for the ode_FE function
M = 500;
r = 0.1; 
f = @(u, t) r*(1 - u/M)*u; 
U_0 = 100; 
T = 60;
N = 20;
dt = 50;

condition = true;
while condition == true
  
    for k = 0:N
          dtk = 2^(-k)*dt; 
          dtk2 = 2^(-(k-1))*dt;
          %call the ode_FE function
          [u1, t1] = ode_FE(f, U_0, dtk, T); % Forward Euler method for compute the function
          [u2, t2] = ode_FE(f, U_0, dtk2, T); %
          plot(t1,u1,'r-',t2,u2,'b-');
          xlabel('t');
          ylabel('N(t)');
          legend('dt(k)','dt(k-1)');
          fprintf('dt(k) = %d, dt(k-1) = %d \n', dtk, dtk2);
          fprintf('Do you want to loop again ? \n');
          question = input('1 = YES, 0 = N0, type = ');
          if question == 0
              break;
          end
    end
    condition = false;
end

