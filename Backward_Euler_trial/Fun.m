
function [f] = Fun(x,y)
% u' = v; 
% y(0) = 0;
% v' = -omega^2*u;
v = y(1);
u = y(2);
omega = 2;
f1_dot = v;
f2_dot = -omega^2*u;
f = [f1_dot,f2_dot];
end

% you can add any amount of equations