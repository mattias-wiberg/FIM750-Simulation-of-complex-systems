clc;
clf;
clear;
N = 1000;
beta = 0.8;
gamma = 0.02;
ifr = 0.7; % Init infection rate
k = beta/gamma;
d = 0.8; % Diffusion rate
L = 100; % Lattice size
mu = 1;
alpha = 0.01;

% S = 1, I = 2, R = 3
averages = 1;
steps = 20;
vars = 7;
SIRt = zeros(steps, vars, averages);
i = 1;
for alpha = 0.01
    alpha
    for avg = 1:averages
        avg
        clf;
        [S, I, R, t] = simulation(L, N, ifr, d, beta, gamma, mu, alpha);
        SIRt(i, :, avg) = [alpha, beta, gamma, S(end), I(end), R(end), t];
    end
    i = i + 1;
end
clf;
hold on;
plot(1:t, S, 'Color', 'b')
plot(1:t, I, 'Color', '#FFA500')
plot(1:t, R, 'Color', 'g')
title(strcat('ifr = ', num2str(ifr,5),' \beta = ', num2str(beta,5),' \gamma = ', num2str(gamma,5),' \alpha = ', num2str(alpha,5)))
pbaspect([1 1 1])
legend('S', 'I', 'R')
saveas(gcf, strcat('./4/',num2str(beta,5),'_g_','b_', num2str(beta,5),'_g_', num2str(gamma,5),'_a_', num2str(alpha,5),'.png'));
%save('SIRt.mat', 'SIRt')