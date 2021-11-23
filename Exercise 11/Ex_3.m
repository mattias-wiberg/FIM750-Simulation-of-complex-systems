clc;
clf;
clear;
N = 1000;
beta = 0.6;
gamma = 0.01;
ifr = 0.01; % Init infection rate
mu = 0.01;
k = beta/gamma;
d = 0.8; % Diffusion rate
L = 100; % Lattice size
alpha = 0.01;

% S = 1, I = 2, R = 3
averages = 3;
steps = 40;
vars = 7;
SIRt = zeros(steps, vars, averages);
i = 1;
for mu = linspace(0.0001, 0.1, steps)
    mu
    for gamma = linspace(0.01, 1, steps) 
        gamma
        for beta = linspace(0.01, 1, steps)
            beta
            for avg = 1:averages
                avg
                clf;
                [S, I, R, t] = simulation(L, N, ifr, d, beta, gamma, mu, alpha);
                SIRt(i, :, avg) = [mu, beta, gamma, S(end), I(end), R(end), t];
            end
            i = i + 1;
        end
    end
end
save('Ex3_mbgSIRt.mat', 'SIRt')