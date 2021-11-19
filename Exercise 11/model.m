clc;
clear;
N = 1000;
beta = 0.1;
gamma = 0.01;
ifr = 0.01; % Init infection rate
k = beta/gamma;
d = 0.8; % Diffusion rate
L = 100; % Lattice size

%% Exercise 1
% S = 1, I = 2, R = 3
for beta = linspace(0, 1, 40)
    world = init_world(L, N, ifr);
    t = 0;
    S = [];
    I = [];
    R = [];
    while ~isempty(find(cellfun(@(x) any(x==2), world), 1))
        world = diffusion(world, L, d);
        world = infect(world, beta);
        world = recover(world, gamma);
        t = t + 1
        %S = [S sum(cellfun(@(x) sum(x==1), world), 'all')];
        %I = [I sum(cellfun(@(x) sum(x==2), world), 'all')];
        %R = [R sum(cellfun(@(x) sum(x==3), world), 'all')];
        %show_world(world);
        %title(strcat('t = ', int2str(t)))
        %pause(0.01)
    end

    clf;
    subplot(1,2,1)
    show_world(world);
    title(strcat('t = ', int2str(t)))
    subplot(1,2,2)
    hold on;
    plot(1:t, S, 'Color', 'b')
    plot(1:t, I, 'Color', '#FFA500')
    plot(1:t, R, 'Color', 'g')
    legend('S', 'I', 'R')
    SIR = [S(end) I(end) R(end)];
    saveas(gcf, strcat('./1/beta_', num2str(beta), '.png'))
    save(strcat('./1/beta_', num2str(beta), '.mat'))
end
%% Exercise 2
% S = 1, I = 2, R = 3
S = zeros(2, 40);
I = [];
R = zeros(2, 40);
i=1;
j=1;
for gamma = [0.01 0.02]
    for beta = linspace(0, 1, 2)
        world = init_world(L, N, ifr);
        t = 0;
        while ~isempty(find(cellfun(@(x) any(x==2), world), 1))
            world = diffusion(world, L, d);
            world = infect(world, beta);
            world = recover(world, gamma);
            t = t + 1
            %show_world(world);
            %title(strcat('t = ', int2str(t)))
            %pause(0.01)
        end
        S(i,j) = sum(cellfun(@(x) sum(x==1), world), 'all');
        %I = [I sum(cellfun(@(x) sum(x==2), world), 'all')];
        R(i,j) = sum(cellfun(@(x) sum(x==3), world), 'all');
        j = j +1;
    end
    i = i + 1;
end
