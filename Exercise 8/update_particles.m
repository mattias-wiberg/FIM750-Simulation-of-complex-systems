function particles = update_particles(particles, Rf)
    particles(:,3) = update_directons(particles);
    particles = update_positions(particles)
    
end

