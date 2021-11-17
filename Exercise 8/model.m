clc;
clear;

% Constants
N = 100; % Particles
L = 100; % Bounding
rho = N/L^2; % density rho = N/L^2
eta = 0.01; % Noise
Rf = 1; % Interaction radius radius
dt = 1; % Delta time
v = 1; % Speed
S = 10^4; % Number of interations
h = 1; % Delay
k = -1; % Nearest Neighbors (Including itself)
fov = deg2rad(180); % Field of vision for each particle

g_align = zeros(S, 1);
g_clust = zeros(S, 1);

% Particles
inital_particles = initilize_particles(N, L, v);
%% Run
g_a_hist = [];
g_c_hist = [];
for fov = [pi pi/2 pi/4]
history = zeros(N, 4, S);
particles = inital_particles;
j = 1;
for i = 1:S
    history(:,:,i) = particles;
    g_align(i) = alignment_coefficient(particles, v);
    g_clust(i) = global_clustering_coeff(particles, Rf, L);
    particles = update_particles(particles, L, Rf, eta, dt, history, h, i, k, fov);
    if any(i == [10 100 500 1000])
        subplot(1, 4, j)
        voronoi(particles(:,1), particles(:,2))
        ylim([-L/2 L/2])
        xlim([-L/2 L/2])
        pbaspect([1 1 1])
        j = j + 1;
    end
    
    %Animation
    %scatter(particles(:,1), particles(:,2), 'filled')
    %ylim([-L/2 L/2])
    %xlim([-L/2 L/2])
    %pause(0.001)
    
    if mod(i, 1000)==1
        fprintf("%d\n",i);
    end
end
%saveas(gcf, strcat('./Images/11/fov_',int2str(fov),'_steps.png'))
g_a_hist = [g_a_hist g_align];
g_c_hist = [g_c_hist g_clust];

clf
subplot(1,3,1)
voronoi(inital_particles(:,1), inital_particles(:,2));
ylim([-L/2 L/2])
xlim([-L/2 L/2])
pbaspect([1 1 1])
subplot(1,3,2)
voronoi(particles(:,1), particles(:,2))
ylim([-L/2 L/2])
xlim([-L/2 L/2])
pbaspect([1 1 1])
subplot(1,3,3)
plot(1:S, g_align);
hold on
plot(1:S, g_clust);
ylim([0 1.1])
legend('\Psi', 'c', 'Location', 'southeast')
xlabel('t')
ylabel('\Psi, c')
pbaspect([1 1 1])
%saveas(gcf, strcat('./Images/11/fov_',int2str(fov),'.png'))
end
%%
clf
subplot(1,2,1)
plot(1:S, g_a_hist)
subplot(1,2,2)
plot(1:S, g_c_hist)