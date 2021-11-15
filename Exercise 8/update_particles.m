function particles = update_particles(particles, L, Rf, eta, dt)
    particles(:,3) = update_directions(particles, L, Rf, eta, dt);
    particles(:,1:2) = update_positions(particles, L, dt);
end

