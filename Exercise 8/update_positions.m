function positions = update_positions(particles, L, dt)
    velocities = get_velocities(particles);
    positions = particles(:,1:2)+velocities*dt;
    positions = new_position(positions, L);
end

