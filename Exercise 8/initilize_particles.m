function particles = initilize_particles(N, L, vmax)
%INITILIZE_PARTICLES p_j = [x, y, direction(theta), velocity]
    particles = [random_array([N, 2], -L/2, L/2) random_array([N, 1], 0, 2*pi) random_array([N,1], vmax, vmax)];
end

