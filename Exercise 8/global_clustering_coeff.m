function cn = global_clustering_coeff(particles, Rf)
    [v,c] = voronoin(particles(:,1:2));
    A = get_voronoi_areas(v,c);
    cn = sum(A < pi*Rf^2)/size(particles, 1);
end