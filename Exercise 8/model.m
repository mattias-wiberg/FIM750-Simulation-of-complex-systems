clc;
clear;

% Constants
N = 100;
L = 100;
rho = N/L^2; % density rho = N/L^2
eta = 0.1; % Noise
Rf = 1; % Interaction radius radius
dt = 1;
v = 1;
S = 10^4; % Number of interations

g_align = zeros(S, 1);
g_clust = zeros(S, 1);

% Particles
inital_particles = initilize_particles(N, L, v);
%% Run
particles = inital_particles;
j = 1;
for i = 1:S
    g_align(i) = alignment_coefficient(particles, v);
    g_clust(i) = global_clustering_coeff(particles, Rf, L);
    particles = update_particles(particles, L, Rf, eta, dt);
    if any(i == [10 100 500 1000])
        subplot(1, 4, j)
        voronoi(particles(:,1), particles(:,2))
        ylim([-L/2 L/2])
        xlim([-L/2 L/2])
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

%% Plotting
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