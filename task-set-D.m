clc, clear, close all;

npts = 240; %number of points
tf = 24; %final time
ti = 0; %initial time
To = 65; %inital T value
h = (tf-ti)/npts; % stepsize

f = @(t,T) ((.25 * -T) + (7 * sech((3/4) * (t - 10)))); %eq3

[t,w] = rk4(ti,tf,npts,To,f); %uses RK4 method to solve for eq3

figure("Name", "RK4 solution")
plot(t, w);
xlabel('Time');
ylabel('Temperature (°F)');
title('Temperature vs Time using RK4 Method');
grid on;

H = zeros(1,npts+1); %initilizes a vector for the solutions of H
H(1) = Hsolution(0); %initial condition ofr H
ttemp = 0; %temp time for for loop

for i = 1 : npts
    ttemp = ttemp + h;
    H(i+1) = Hsolution(ttemp); %evaluates H at each time step
end

figure("Name", "H solutions")
plot(t,H,"b-");
xlabel("time (hours)");
ylabel("temperature (°F)");
grid on;

Tmax = max(w); %finds the max temperature inside the building
tTmax = find(Tmax) * h; %finds the time where the temp is at max
