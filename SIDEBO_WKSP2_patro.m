%%SCORE: 5  I fixed a few things, but you were close


%% Numerical Simulation of Balloon Pendulum by Shailesh Patro
% The objective of this code is to simulate a balloon pendulum in free
% oscillation mode on MATLAB(R).
% Course - ESC340M: Fluid Mechanics (Fall 2017)
% Professor Sidebotham
%%
clear all
clc
%% Fixed Constants
g = 9.81;               % in m/s^2
R = 287;                % of air in J/(kgK)

%% Input Parameters
theta0 = (10/180)*pi;   %in radians 

L = input('Enter a string length (in cm):');
L = L/100;              % To get string length in m
d = 0.2;                % in m (constant default balloon diameter)
Mrub = 4/1000;          % in kg
Tamb = 298;             % in K
Pamb = 1.01325e05;      % in Pa
Cd = 0.5;                % drag coefficient

%% Derived Parameters

rho = Pamb/(R*Tamb);        % in kg/m^3
Fb = 4/3*pi*(d/2)^3*rho*g;  % in N
Mair = Fb/g;                % in kg
M = Mrub + Mair;            % in kg

%% Define Variables and allocated space
n = 50;                    
tmax = 100;                 
n = 1e6;  % Let n be the total number of time steps to take
tmax = 30;  % Total time to simulate in s
trange = linspace(0,tmax,n); 
delt = tmax/(n-1); 
omega(1) = 0;
theta(1) = theta0;
for i=1:n-1
    omega(i+1) = omega(i)+delt*(-g/L*(1-Fb/(M*g))*sin(theta(i))-((pi*Cd*rho*L*d^2)/(8*M))*omega(i)*abs(omega(i)));
    theta(i+1) = theta(i)+delt*omega(i);
end

%% Output

plot(trange,theta*180/pi)  %%in degrees