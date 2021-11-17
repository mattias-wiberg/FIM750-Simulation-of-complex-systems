function particles = update_particles(particles, L, Rf, eta, dt, history, h, n)
    s = 10;
    directions = update_directions(particles, L, Rf, eta, dt);
    positions = update_positions(particles, L, dt);
    
    if h > 0 && n > h
        particles(:, 1:2) = positions;
        particles(:, 3) = update_directions(history(:,:,n-h), L, Rf, eta, dt);
    elseif h < 0 && n > s
        N = size(particles, 1);
        future_directions = zeros(N, 1);
        for i = 1:N
            p = polyfit(1:s, history(i, 3, n-s:n-1), 1);
            future_directions(i) = polyval(p, s+abs(h));
        end
        particles(:, 3) = future_directions;
        particles(:, 1:2) = update_positions(particles, L, dt);
        particles(:, 3) = directions;
    else
        particles(:, 1:2) = positions;
        particles(:, 3) = directions;
    end
end

