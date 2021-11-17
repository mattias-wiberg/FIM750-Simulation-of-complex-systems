function directions = update_directions(particles, L, Rf, eta, dt, k, fov)
    N = size(particles, 1);
    directions = zeros(N, 1);
    for j = 1:N
        in_range = get_particles_in_range(particles, particles(j,1:2), L, Rf, k, fov);
        % Circular mean https://en.wikipedia.org/wiki/Circular_mean
        alpha = particles(in_range, 3);
        if length(in_range) > 1
            avg = atan(mean(sin(alpha))/mean(cos(alpha)));
        else
            avg = alpha;
        end
        Wn = rand()-0.5;
        directions(j) = avg + eta*Wn*dt;
    end
    
end

