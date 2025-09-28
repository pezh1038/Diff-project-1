clc;
clear;
close all;
%% Define Function for T
% Mi = initial external heat
% k = equilibrium constant
% ti = initial time
% tf = final time
% Ti = initial internal heat

function [T] = temp_H0_Q0_Mconst(Mi, k, ti, tf, Ti)
    for i = ti:tf
        T(i + 1) = Mi + exp(k * (ti - i)) * (Ti - Mi);
    end
end

%% Call Function for 2 Ti

T50 = temp_H0_Q0_Mconst(75, 0.25, 0, 24, 50);
T80 = temp_H0_Q0_Mconst(75, 0.25, 0, 24, 80);

%% Plot Functions

for i = 0:24
    time(i+1) = i;
end

subplot(1, 2, 1);
plot(time, T50);
hold on
plot(time, T80);
yline(75, 'k', 'External Temp')
legend('T_int less than T_ext', 'T_int greater than T_ext') % T internal and T external
hold off

%% Call Function for Different Kappas

k1 = temp_H0_Q0_Mconst(75, 1, 0, 24, 50);
k0_5 = temp_H0_Q0_Mconst(75, 0.5, 0, 24, 50);
k0_25 = temp_H0_Q0_Mconst(75, 0.25, 0, 24, 50);

subplot(1, 2, 2);
plot(time, k1)
hold on
plot(time, k0_5)
plot(time, k0_25)
legend('Kappa = 1', 'Kappa = 0.5', 'Kappa = 0.25')
