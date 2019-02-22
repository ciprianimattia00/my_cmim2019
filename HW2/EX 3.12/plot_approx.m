% function that plot in the dame graph the function SN(t) and f(t) with the
% best approximation obtained thanks the 'b' values provided by integrate_coefficient(f, N, M)

function plot_approx(f, N, M, filename)

bn_values = integrate_coefficient(f, N, M);
t = linspace(-pi,pi,M); % soluzione all'ultima domanda è ridurre t, per esempio tra (-3.075,pi)

SN = sinesum(bn_values, t); % call the function sinesum for the plot.

plot(t, f(t), t, SN); % plot the functions, with the time on x-axis

xlabel('time'); 
ylabel('SN(t),f(t)');
legend('f(t)','SN(t)');
title(filename); % title of the plot

end