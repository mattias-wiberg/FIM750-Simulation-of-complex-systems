clc;
clear;
N = 1000;
beta = 0.6;
lambda = 0.01;
ifr = 0.01; % Init infection rate
k = beta/lambda;
d = 0.8; % Diffusion rate
L = 5; % Lattice size

% S = 1, I = 2, R = 3
world = init_world(L);
