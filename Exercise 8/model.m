clc;
clear all;

% Constants
N = 10;
L = 10;
rho = N/L^2; % density rho = N/L^2
eta = 0; % Noise
Rf = 1; % Interaction radius radius
dt = 1;

% Particles
particles = initilize_particles(N, L);
