
% initial condition of the system
a = 0.1; % [m]
b = 0.2; % [m]
w = 1; % [rad/s]
fi = pi/6; % [°]  % crank angle

% function in function of teta angle and d = distance where x = [teta; d]
F = @(x) [a*cos(fi) + b*cos(x(1))- x(2);a*sin(fi) - b*sin(x(1))];

% Jacobian of the previous function
J =  @(x) [-b*sin(x(1)) , -1 ; -b*cos(x(1)) , 0];

% Newton Raphson's method for solving the non linear function
[x, iteration_counter] = NR_method(F, J, [pi/10; 0.1], 1e-4);

% interval of time 
N = 20; 

% itializations of vectors for storing values of teta and distance
teta_values = zeros(1,N/0.1+1);
d_values = zeros(1,N/0.1+1);

% itializations of vectors for storing values of teta-dot and d-dot
angular_velocity = zeros(1,N/0.1+1);
slider_velocity = zeros(1,N/0.1+1);

% itializations of vectors for storing values of teta-dot-dot and d-dot-dot
angular_acc = zeros(1,N/0.1+1);
slider_acc = zeros(1,N/0.1+1);

% initialization of a vector for storing values of fi
crank_angle = zeros(1,N/0.1+1);

% in the following lines the loop is run in order to implement the
% dipendance of fi angle with time
for i = 1:N/0.1+1
    
    % vector with values of time from 1 second to N seconds with intervals 
    % of 0.1 second
    t = [0:0.1:N];
    
    % fi with dependance from time 
    fi = pi/6 +w*t(i);
    crank_angle(i) = fi;
    
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
    slider_velocity(i) = velocity(2);
    
    % computation of the acceleration
    G = [a*w^2*cos(fi)+b*(angular_velocity(i))^2*cos(teta_values(i)); +a*w^2*sin(fi)-b*(angular_velocity(i))^2*sin(teta_values(i))];
    acc = J2\G;
    % storing values for teta-dot-dot and d-dot-dot
    angular_acc(i) = acc(1);
    slider_acc(i) = acc(2);
    
    
    
end

% plot teta and d in function of time
figure
plot(t, teta_values);
xlabel('t [s]');
ylabel('teta [rad]');
title(sprintf('Teta(t)in an intervals of seconds from 0 to %d', N));

% plot d in function of time
figure
plot(t, d_values);
xlabel('t [s]');
ylabel('d = position [m]');
title(sprintf('d(t) in an intervals of seconds from 0 to %d', N));

% plot the angular velocity in function of time
figure
plot(t,angular_velocity);
xlabel('t [s]');
ylabel('angular velocity [rad/s]');
title(sprintf('angular velocity in an intervals of seconds from 0 to %d', N));

% plot the slider velocity in function of time
figure
plot(t,slider_velocity);
xlabel('t [s]');
ylabel('slider velocity [m/s]');
title(sprintf('slider velocity in an intervals of seconds from 0 to %d', N));

% plot the angular acceleration in function of time 
figure
plot(t,angular_acc);
xlabel('t [s]');
ylabel('angular acc [rad/s^2]');
title(sprintf('angular acceleration in an intervals of seconds from 0 to %d', N));

% plot the slider acceleration
figure
plot(t,slider_acc);
xlabel('t [s]');
ylabel('slider acc [rad/s^2]');
title(sprintf('slider acceleration in an intervals of seconds from 0 to %d', N));

% % plot the crank and slider acceleration and velocity in function of the crank angle
% figure
% plot(crank_angle,slider_acc,crank_angle, slider_velocity);
% xlabel('fi = crank angle');
% ylabel('slider acc');
% title(sprintf('slider acceleration in function of fi', N));
% axis([0.5236 20.5236 -0.2 0.2]);


