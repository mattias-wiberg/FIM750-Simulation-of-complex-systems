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
        pbaspect([1 1 1])
        j = j + 1;
    end
    
    if mod(i, 1000)==1
        disp(i);
    end
end

%% Plotting
clf
subplot(1,3,1)
voronoi(inital_particles(:,1), inital_particles(:,2));
pbaspect([1 1 1])
ylim([-L/2 L/2])
xlim([-L/2 L/2])
subplot(1,3,2)
voronoi(particles(:,1), particles(:,2))
pbaspect([1 1 1])
ylim([-L/2 L/2])
xlim([-L/2 L/2])
subplot(1,3,3)
plot(1:S, g_align);
hold on
plot(1:S, g_clust);
ylim([0 1.1])
legend('\Psi', 'c')
xlabel('t')
ylabel('\Psi, c')
pbaspect([1 1 1])
%% Voronoi correct?
M = [
    particles(:,1) particles(:,2)
    particles(:,1)-L particles(:,2)-L
    particles(:,1)-L particles(:,2)
    particles(:,1)-L particles(:,2)+L
    particles(:,1) particles(:,2)-L
    particles(:,1) particles(:,2)+L
    particles(:,1)+L particles(:,2)-L
    particles(:,1)+L particles(:,2)
    particles(:,1)+L particles(:,2)+L];
voronoi(M(:,1), M(:,2))
grid on
xticks([-L L]./2)
yticks([-L L]./2)
[v, c] = voronoin(M(:,1:2));
total_a = 0;
for i = 1:100
    v1 = v(c{i},1);
    v2 = v(c{i},2);
    patch(v1, v2, 'C')
    total_a = total_a + polyarea(v1,v2);
end
total_a
[v, c] = voronoin(particles(:,1:2));
(total_a-nansum(get_voronoi_areas(v, c)))/total_a