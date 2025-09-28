clear; clc; close all;

npts = 240; %number of points
tf = 24; %final time
ti = 0; %initial time
h = (tf-ti)/npts; % stepsize

f = @(t,T) (.25 *  (75-T));

[t,w] = rk4(ti,tf,npts,50,f);

figure("Name","solution vs approx");
plot(t,w,"or");

xlabel('Time (hours)');
ylabel('Temperature (°F)');
title('Temperature vs Time using RK4 Method');
grid on;
hold on;

SOL = zeros(1,npts+1); %initilizes an array for the exact solutions
SOL(1,1) = 50; %sets initial condition
ttemp = 0; %temp time used in for loop

for i = 1 : npts
    ttemp = ttemp + h;
    SOL(i+1) = DEQsolution(ttemp); % Calculate the exact solution
end

plot(t,SOL,"-b")
hold off;

error = zeros(1, npts+1); %initilizes an array for error

for i = 1 : npts+1
    error(i) = abs(SOL(i) - w(i)); % claculates error
end

figure("Name","error");
plot(t,error,"r-");
xlabel("time (hours)");
ylabel('Error (°F)');
title('Error vs Time');
grid on;
