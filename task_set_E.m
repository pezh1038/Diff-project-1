clc;
clear;
close all;
%% Call rk4

ti = 0;
tf = 24;
npts = 250;
y01 = 65;
y02 = 95;
Td = 77;
kd1 = 0.2;
kd2 = 2.0;
f1 = @(t, T) kd1 * (Td - T);
f2 = @(t, T) kd2 * (Td - T);

% Have 4 variations of the equation with y01, y02, kd1, and kd2
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