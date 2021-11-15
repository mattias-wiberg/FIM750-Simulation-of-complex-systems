function cn = global_clustering_coeff(particles, Rf, L)
    A = get_voronoi_areas(particles, L);
    cn = sum(A < pi*Rf^2)/size(particles, 1);
end