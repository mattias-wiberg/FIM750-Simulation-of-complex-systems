clc;
clear;
N = 20;
beta = 0.5;
gamma = 1;
ifr = 0.5; % Init infection rate in %
k = beta/gamma;
d = 0.8; % Diffusion rate
L = 3; % Lattice size

% S = 1, I = 2, R = 3
world = init_world(L, N, ifr);
while ~isempty(find(cellfun(@(x) any(x==2), world), 1))
    world = diffusion(world, L, d);
    world = infect(world, beta);
    world = recover(world, beta);
end
world