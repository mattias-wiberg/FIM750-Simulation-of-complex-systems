clc;
clear;

% Constants
N = 100;
L = 100;
rho = N/L^2; % density rho = N/L^2
eta = 0.01; % Noise
Rf = 1; % Interaction radius radius
dt = 1;
v = 1;
S = 10^4; % Number of interations

g_align = zeros(S, 1);
g_clust = zeros(S, 1);

% Particles
inital_particles = initilize_particles(N, L, v);
particles = inital_particles;
for i = 1:S+1
    g_align(i) = alignment_coefficient(particles, v);
    g_clust(i) = global_clustering_coeff(particles, Rf);
    particles = update_particles(particles, L, Rf, eta, dt);
end

%% Plotting
[v,c] = voronoin(inital_particles(:,1:2));
A = get_voronoi_areas(v,c);

clf
subplot(1,3,1)
voronoi(inital_particles(:,1), inital_particles(:,2));
subplot(1,3,2)
voronoi(particles(:,1), particles(:,2))
subplot(1,3,3)
plot(1:S, g_align);
hold on
%plot(1:S, 1:S)
legend('\Psi', 'c')
xlabel('t')
ylabel('\Psi, c')