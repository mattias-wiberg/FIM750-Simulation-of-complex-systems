clc;
clf;
clear;
N = 1000;
beta = 0.1;
gamma = 0.02;
ifr = 0.01; % Init infection rate
k = beta/gamma;
d = 0.8; % Diffusion rate
L = 100; % Lattice size
%% Exercise 1 & 2
% S = 1, I = 2, R = 3
SRt = zeros(20,5);
i = 1;
for beta = linspace(0,1,40)
    beta
    Ravg = 0;
    for avg = 1:5
        avg
        clf;
        world = init_world(L, N, ifr);
        t = 0;
        S = [];
        I = [];
        R = [];
        while any_infected(world)
            world = diffusion(world, L, d);
            world = infect(world, beta);
            world = recover(world, gamma);
            t = t + 1;
            [nS, nI, nR] = get_SIR(world);
            S = [S nS];
            I = [I nI];
            R = [R nR];
            if mod(t,25) == 0
                %show_world(world);
                %title(strcat('t = ', int2str(t)))
                %pause(0.01)
            end
        end
        Ravg = Ravg + nR;
    end
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
    saveas(gcf, strcat('./1/beta_', num2str(beta, 5), '.png'));
    %save(strcat('./1/beta_', num2str(beta, 5), '.mat'))
    i = i + 1;
end
%% 2.a
clf;
hold on;
scatter(SIRt(:, 1), SIRt(:, 5), 'blue', 'filled')
scatter(Rt(:, 1), Rt(:,3), 'green', 'filled')
legend('\gamma = 0.01', '\gamma = 0.02')
ylabel('R_\infty')
xlabel('\beta')
%% 2.b
clf;
hold on;
scatter(SIRt(:, 1)/0.01, SIRt(:, 5), 'blue', 'filled')
scatter(Rt(:, 1)/0.02, Rt(:,3), 'green', 'filled')
legend('\gamma = 0.01', '\gamma = 0.02')
ylabel('R_\infty')
xlabel('\beta/\gamma')

