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
averages = 1;
steps = 20;
vars = 6;
SIRt = zeros(steps, vars, averages);
i = 1;
for k = linspace(2, 80, steps) %beta/gamma
    for beta = linspace(0.01, 1, steps)
        beta
        gamma = beta/k
        for avg = 1:averages
            avg
            clf;
            [S, I, R, t] = simulation(L, N, ifr, d, beta, gamma, mu, alpha);
            SIRt(i, :, avg) = [beta, gamma, S(end), I(end), R(end), t];
        end
        i = i + 1;
    end
end
save('SIRt.mat', 'SIRt')
%%
clf;

subplot(1,2,1)
show_world(world);
title(strcat('t = ', int2str(t)))
pbaspect([1 1 1])

subplot(1,2,2)
hold on;
plot(1:t, S, 'Color', 'b')
plot(1:t, I, 'Color', '#FFA500')
plot(1:t, R, 'Color', 'g')
title(strcat(' \beta = ', num2str(beta,5)))
pbaspect([1 1 1])
legend('S', 'I', 'R')

Rt(i, :) = [beta gamma Ravg/5 t];
%saveas(gcf, strcat('./1/beta_', num2str(beta, 5), '.png'));
%save(strcat('./1/beta_', num2str(beta, 5), '.mat'))
%% 2.a
clf;
hold on;
scatter(muSIRt(:, 1), muSIRt(:, 5), 'blue', 'filled')
scatter(Rt(:, 1), Rt(:,3), 'green', 'filled')
legend('\gamma = 0.01', '\gamma = 0.02')
ylabel('R_\infty')
xlabel('\beta')
%% 2.b
clf;
hold on;
scatter(muSIRt(:, 1)/0.01, muSIRt(:, 5), 'blue', 'filled')
scatter(Rt(:, 1)/0.02, Rt(:,3), 'green', 'filled')
legend('\gamma = 0.01', '\gamma = 0.02')
ylabel('R_\infty')
xlabel('\beta/\gamma')
%% 3.ab
clf;
hold on;
all_avg = mean(muSIRt, 3);
scatter(all_avg(:, 1), N-(all_avg(:,2)+all_avg(:,4)), 'blue', 'filled')
ylabel('D_\infty')
xlabel('\mu')

