function psi = alignment_coefficient(particles, v)
    velocities = get_velocities(particles);
    N = size(particles, 1);
    psi = norm(sum(velocities)/v)/N;
end