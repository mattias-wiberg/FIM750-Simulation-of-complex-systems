function in_range = get_particles_in_range(particles, position, L, Rf)
    % calc differance on all particles except current one
    differance = abs(particles(:,1:2) - position);
    % Wrap around distance when over L/2
    differance(differance > L/2) = L - differance(differance > L/2); 

    in_range = sqrt(sum(differance.^2, 2)) < Rf;
end

