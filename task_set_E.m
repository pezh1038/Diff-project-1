clc;
clear;
close all;
%% Call rk4

ti = 0; % Initial time
tf = 24; % Final time
npts = 250; % Amount of points between times
y01 = 65; % Initial condition
y02 = 95; % Initial condition
Td = 77; % Constant(Thermostat set to:)
kd1 = 0.2; % Equilibrium Constant
kd2 = 2.0; % Equilibrium Constant
f1 = @(t, T) kd1 * (Td - T);
f2 = @(t, T) kd2 * (Td - T);

% Have 4 variations of the equation with y01, y02, kd1, and kd2
% Solve the differential equation with all 4 variations
[t1, w1] = rk4(ti, tf, npts, y01, f1); 
[t2, w2] = rk4(ti, tf, npts, y01, f2);
[t3, w3] = rk4(ti, tf, npts, y02, f1);
[t4, w4] = rk4(ti, tf, npts, y02, f2);

%% Plots

subplot(2, 2, 1)
plot(t1, w1)
title('T0 = 65, kd = 0.2')
ylabel('Temperature[°F]')
xlabel('time(hrs)')
subplot(2, 2, 2)
plot(t2, w2)
title('T0 = 65, kd = 2.0')
ylabel('Temperature[°F]')
xlabel('time(hrs)')
subplot(2, 2, 3)
plot(t3, w3)
title('T0 = 95, kd = 0.2')
ylabel('Temperature[°F]')
xlabel('time(hrs)')
subplot(2, 2, 4)
plot(t4, w4)
title('T0 = 95, kd = 2.0')
ylabel('Temperature[°F]')
xlabel('time(hrs)')
