clc, clear, close all;

%% F-1
npts = 240; %number of points
tf = 24; %final time
ti = 0; %initial time
To = 75; %inital T value
h = (tf-ti)/npts; % stepsize

f1 = @(t,T) (Hsolution(t) + 2 * (77 - T)); %eq

[t,w1] = rk4(ti,tf,npts,To,f1); %uses RK4 method to solve for eq

%a
T1max = max(w1); %finds max temperature
tT1max = (find(w1 == T1max) * h) - h; %finds time at max temp

%b
%answer is yes

%c
%yes around 77 degrees F

% Plot the results
figure("Name", "Only H and Q");
plot(t, w1);
xlabel('Time (s)');
ylabel('Temperature (°F)');
title('Temperature vs Time');
grid on;


%% F-2

f2 = @(t,T) (0.25 * (Msolution(t) - T)); %eq

[t,w2] = rk4(ti,tf,npts,To,f2); %uses RK4 method to solve for eq

T2max = max(w2); %finds max temp
tT2max = (find(w2 == T2max) * h) - h; %finds t at max temp

%a
%91.8 degrees

%b

T81 = (find(w2 > 81) * h); %array of times when T > 81
Tint = T81(end) - T81(1); %the amount of time spent over 81 degrees

figure("Name", "Only A");
plot(t, w2);
xlabel('Time (s)');
ylabel('Temperature (°F)');
title('Temperature vs Time');
grid on;


%% F-3

kd1 = 2; %k constant 1
kd2 = 0.5; %k constant 2

f3a = @(t,T) ((0.25 * (Msolution(t) - T) + kd1 * (77 - T))); %eq

[t,w3a] = rk4(ti,tf,npts,To,f3a); %uses RK4 method to solve for eq

T3aMax = max(w3a); %max temp when kd = 2

figure("Name", "Only A and Q")
plot(t,w3a,"r-");
xlabel("time (hours)");
ylabel("temperature (°F)");
title("A and Q effects on T");
grid on;
hold on;

f3b = @(t,T) ((0.25 * (Msolution(t) - T) + kd2 * (77 - T))); %eq

[t,w3b] = rk4(ti,tf,npts,To,f3b); %uses RK4 method to solve for eq

T3bMax = max(w3b); %max temp when kd = 0.5

plot(t, w3b, 'b-');
legend('kd1 = 2', 'kd2 = 0.5');
hold off;

%b

T812 = (find(w3b > 81) * h); %array of times when T > 81
Tint2 = T812(end) - T812(1); %the amount of time spent over 81 degrees

%the equipment will not be safe at kd = 0.5

%% F-4

npts4 = 720; %number of points
tf4 = 72; %final time
h4 = (tf-ti)/npts4; % stepsize

f4 = @(t,T) ((0.25 * (Msolution(t) - T)) + Hsolution(t) + (2 * (77 - T))); %eq

[t,w4] = rk4(ti,tf4,npts4,To,f1); %uses RK4 method to solve for eq

T4max = max(w4); %finds max temperature for F-4

figure("Name", "everything")
plot(t,w4,"r-");
xlabel("time (hours)");
ylabel("temperature (°F)");
title("RK4 approx of T");
grid on;
hold on;

%a 
%it will be safe (not reach 81 degrees)

%b
%yes it does

%c
M = zeros(1,npts4+1); %initilizes a vector for the solutions of M
M(1) = Msolution(0); %initial condition ofr M
ttemp = 0; %temp time for for loop

for i = 1 : npts4
    ttemp = ttemp + h4;
    M(i+1) = Msolution(ttemp); %evaluates M at each time step
end

plot(t,M,"b-");
legend('T', 'M');
hold off;

%d
%the ac is holing it steady

