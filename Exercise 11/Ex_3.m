clc;
clf;
clear;
N = 1000;
beta = 1;
gamma = 0.0001;
ifr = 0.01; % Init infection rate
mu = 0.003;
k = beta/gamma;
d = 0.8; % Diffusion rate
L = 100; % Lattice size
alpha = 0.01;

% S = 1, I = 2, R = 3
averages = 2;
steps = 5;
vars = 7;
SIRt = zeros(1, vars, averages);
i = 1;
for mu = 0.003
    for avg = 1:averages
        avg
        clf;
        [S, I, R, t] = simulation(L, N, ifr, d, beta, gamma, mu, alpha);
        SIRt(i, :, avg) = [mu, beta, gamma, S(end), I(end), R(end), t];
    end
    i = i + 1;
end
save('Ex3_mbgSIRt.mat', 'SIRt')
%%
meanSIRt = mean(SIRt,3)
N-(meanSIRt(4)+meanSIRt(6))