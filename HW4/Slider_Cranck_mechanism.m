
% initial condition of the system
a = 0.1; % [m]
b = 0.2; % [m]
w = 1; % [rad/s]
fi = pi/6; % [°]

% function in function of teta angle and d = distance where x = [teta; d]
F = @(x) [a*cos(fi) + b*cos(x(1))- x(2);a*sin(fi) - b*sin(x(1))];

% Jacobian of the previous function
J =  @(x) [-b*sin(x(1)) , -1 ; -b*cos(x(1)) , 0];

% Newton Raphson's method for solving the non linear function
[x, iteration_counter] = NR_method(F, J, [pi/10; 0.1], 1e-4);

% interval of time 
N = 15; 

% itializations of vectors for storing values of teta and distance
teta_values = zeros(1,N/0.1+1);
d_values = zeros(1,N/0.1+1);

% itializations of vectors for storing values of teta-dot and d-dot
angular_velocity = zeros(1,N/0.1+1);
tang_velocity = zeros(1,N/0.1+1);

% itializations of vectors for storing values of teta-dot-dot and d-dot-dot
angular_acc = zeros(1,N/0.1+1);
tang_acc = zeros(1,N/0.1+1);

% in the following lines the loop is run in order to implement the
% dipendance of fi angle with time
for i = 1:N/0.1
    
    % vector with values of time from 1 second to N seconds with intervals 
    % of 0.1 second
    t = [0:0.1:N];
    
    % fi with dependance from time 
    fi = pi/6 +w*t(i);
    
    % function and Jacobian of the fucntion
    F = @(x) [a*cos(fi) + b*cos(x(1))- x(2);a*sin(fi) - b*sin(x(1))];
    J =  @(x) [-b*sin(x(1)) , -1 ; -b*cos(x(1)) , 0];

    % Newton-Raphson's method
    [z, iteration_counter] = NR_method(F, J, [pi/10; 0.1], 1e-6);
    
    % storing values for teta and distance at every loop
    teta_values(i) = z(1);
    d_values(i) = z(2);
    
    % computation of the velocity
    J2 = [-b*sin(teta_values(i)) , -1 ; -b*cos(teta_values(i)) , 0]; 
    ft = -[-a*w*sin(fi);a*w*cos(fi)];
    velocity = J2\ft;
    % storing values for teta-dot and d-dot
    angular_velocity(i) = velocity(1);
    tang_velocity(i) = velocity(2);
    
    % computation of the acceleration
    G = [a*w^2*cos(fi)+b*(angular_velocity(i))^2*cos(teta_values(i)); +a*w^2*sin(fi)-b*(angular_velocity(i))^2*sin(teta_values(i))];
    acc = J2\G;
    % storing values for teta-dot-dot and d-dot-dot
    angular_acc(i) = acc(1);
    tang_acc(i) = acc(2);
    
end

% plot teta in function of time
figure
plot(t, teta_values);
xlabel('t');
ylabel('teta');
title(sprintf('Teta(t) in an intervals of seconds from 0 to %d', N));

% plot d in function of time
figure
plot(t, d_values);
xlabel('t');
ylabel('d = position');
title(sprintf('d(t) in an intervals of seconds from 0 to %d', N));

% plot the angular velocity in function of time
figure
plot(t,angular_velocity);
xlabel('t');
ylabel('angular velocity');
title(sprintf('Angular velocity in an intervals of seconds from 0 to %d', N));

% plot the tangential velocity in function of time
figure
plot(t,tang_velocity);
xlabel('t');
ylabel('tangential velocity');
title(sprintf('tangential velocity in an intervals of seconds from 0 to %d', N));

% plot the angular acceleration in function of time 
figure
plot(t,angular_acc);
xlabel('t');
ylabel('angular acc');
title(sprintf('Angular acceleration in an intervals of seconds from 0 to %d', N));

% plot the tangential acceleration
figure
plot(t,tang_acc);
xlabel('t');
ylabel('tangential acc');
title(sprintf('tangential acceleration in an intervals of seconds from 0 to %d', N));

