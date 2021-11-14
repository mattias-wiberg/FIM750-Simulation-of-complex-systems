function particles = initilize_particles(N, L)
%INITILIZE_PARTICLES p_j = [x,y,theta]
    particles = [random_array([N, 2], -L/2, L/2) random_array([N, 1], 0, 2*pi)];
end

