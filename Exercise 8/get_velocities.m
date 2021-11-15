function velocities = get_velocities(particles)
    velocities = particles(:,4).*[cos(particles(:,3)) sin(particles(:,3))];
end

