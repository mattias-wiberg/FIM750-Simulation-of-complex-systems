function directions = update_directions(particles, Rf, dt)
    directions = zeros(size(particles));
    for j = 1:size(particles)
        % calc differance on all particles except current one
        differance = abs(particles(setdiff(1:end, j),1:2) - particles(j, 1:2));
        % Wrap around distance when over L/2
        differance(differance > L/2) = L - differance(differance > L/2); 
        
        in_range = sqrt(sum(differance.^2, 2)) < Rf;
        avg = mean(particles(in_range, 3));
        Wn = randn();
        directions(j) = avg + eta*Wn*dt;
    end
end

