clc;
clear;
close all;
%% Call rk4

ti = 0; % Initial Time
tf = 24; % Final Time
npts = 250; % Amount of points between times
y0 = 65; % Independant Initial Value
M0 = 35; % Used for M(t)
f = @(t, T) 0.25 * (M0 - 12 * cos((pi * (t - 5)) / 12) - T); % Find the solution for the differential Equation
% Find times and values for just M(t)
t2 = linspace(ti,tf,npts+1); % Get the array of times between ti and tf with 251(npts+1) numbers
w2 = M0 - 12 * cos((pi * (t2 - 5)) / 12); % Setup and solve the equation M(t) for all times
% Determine time step
h = (tf - ti) / npts;

[t, w] = rk4(ti, tf, npts, y0, f);

%% Find Max and Mins

maxf = max(w); % Max of function w
minf = min(w); % Min of function w
Imaxf = find(w == max(w)); % Find the index where the max and min are
Iminf = find(w == min(w));
tmaxf = Imaxf * h - h; % Determine what time that index occurs by multiplying the point by the timestep(h)
tminf = Iminf * h - h;
maxf2 = max(w2);
minf2 = min(w2);
Imaxf2 = find(w2 == maxf2);
Iminf2 = find(w2 == minf2);
tmaxf2 = Imaxf2 * h - h;
tminf2 = Iminf2 * h - h;


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
