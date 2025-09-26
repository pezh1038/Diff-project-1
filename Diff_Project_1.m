clear; clc; close all;

f = @(t,T) (.25 *  (75-T));

[t,w] = rk4(0,24,240,50,f);

plot(t,w,"or");

