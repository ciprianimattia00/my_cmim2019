
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

% in the following lines the loop is run in order to implement the
% dipendance of fi angle with time
N = 25; % number of seconds
% itializations of two vectors for storing values of teta and distance
teta_values = zeros(1,N/0.1+1);
d_values = zeros(1,N/0.1+1);
angular_velocity = zeros(1,N/0.1+1);
tang_velocity = zeros(1,N/0.1+1);
angular_acc = zeros(1,N/0.1+1);
tang_acc = zeros(1,N/0.1+1);


for i = 1:N/0.1
    
    % vector with values of time from 1 second to N seconds with intervals 
    % of 0.1 second
    t = [0:0.1:N];
    
    % fi with dependance from time 
    fi = pi/6 +w*t(i);
    
    F = @(x) [a*cos(fi) + b*cos(x(1))- x(2);a*sin(fi) - b*sin(x(1))];
    J =  @(x) [-b*sin(x(1)) , -1 ; -b*cos(x(1)) , 0];

    [z, iteration_counter] = NR_method(F, J, [pi/10; 0.1], 1e-6);
    
    % storing value for teta and distance at every loop
    teta_values(i) = z(1);
    d_values(i) = z(2);
    
    J2 = [-b*sin(teta_values(i)) , -1 ; -b*cos(teta_values(i)) , 0]; 
    ft = -[-a*w*sin(fi);a*w*cos(fi)];
    velocity = J2\ft;
    angular_velocity(i) = velocity(1);
    tang_velocity(i) = velocity(2);
    
    
%     G = [-a*w^2*cos(fi) - b*angular_velocity(i)^2*cos(teta_values(i)); -a*w^2*sin(fi) + b*angular_velocity(i)^2*sin(teta_values(i))]; % minus G not G
%     a = J2\G;
%     angular_acc(i) = a(1);
%     tang_acc(i) = a(2);
    
end

% plotting teta in function of time
figure
plot(t, teta_values);
xlabel('t');
ylabel('teta');
title('Teta(t) in an intervals of seconds from 0 to 25');

figure
plot(t,angular_velocity);
xlabel('t');
ylabel('angular velocity');
title('Angular velocity in an intervals of seconds from 0 to 25');

figure
plot(t,angular_acc);
xlabel('t');
ylabel('angular acc');
title('Angular acceleration in an intervals of seconds from 0 to 25');
