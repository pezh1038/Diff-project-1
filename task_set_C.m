clc;
clear;
close all;
%% Call rk4

ti = 0;
tf = 24;
npts = 250;
y0 = 65;
M0 = 35;
f = @(t, T) 0.25 * (M0 - 12 * cos((pi * (t - 5)) / 12) - T);
% Find times and values for just M(t)
t2 = linspace(ti,tf,npts+1);
w2 = M0 - 12 * cos((pi * (t2 - 5)) / 12);
% Determine time step
h = (tf - ti) / npts;

[t, w] = rk4(ti, tf, npts, y0, f);

%% Find Max and Mins

maxf = max(w);
minf = min(w);
Imaxf = find(w == max(w));
Iminf = find(w == min(w));
tmaxf = Imaxf * h;
tminf = Iminf * h;
maxf2 = max(w2);
minf2 = min(w2);
Imaxf2 = find(w2 == maxf2);
Iminf2 = find(w2 == minf2);
tmaxf2 = Imaxf2 * h;
tminf2 = Iminf2 * h;


%% Plot eq.3 and M(t)

plot(t, w);
hold on
% These plot points on the graph (max and min)
plot(tmaxf, maxf, 'mo')
plot(tminf, minf, 'bo')
plot(t2, w2, 'r--');
plot(tmaxf2, maxf2, 'm^')
plot(tminf2, minf2, 'b^')
legend('Equation 3 Soln', 'Internal Temp Max', 'Internal Temp Min','M(t)', ...
    'External Temp Max', 'External Temp Min')
xlabel('time[hrs]')
ylabel('Temperature[°F]')