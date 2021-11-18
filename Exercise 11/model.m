clc;
clear;
N = 3;
beta = 0.6;
lambda = 0.01;
ifr = 0.1; % Init infection rate in %
k = beta/lambda;
d = 1; % Diffusion rate
L = 3; % Lattice size

% S = 1, I = 2, R = 3
world = init_world(L, N, ifr)
% Move agent (diffusion)
for i = 1:10
    world = diffusion(world, L, d)
end