function directions = update_directions(particles, L, Rf, eta, dt)
    nParticles = size(particles, 1);
    directions = zeros(nParticles,1);
    for j = 1:nParticles
        % calc differance on all particles except current one
        differance = abs(particles(setdiff(1:end, j),1:2) - particles(j, 1:2));
        % Wrap around distance when over L/2
        differance(differance > L/2) = L - differance(differance > L/2); 
        
        in_range = sqrt(sum(differance.^2, 2)) < Rf;
        Wn = randn();
        if sum(in_range) > 0
            avg = mean(particles(in_range, 3));
            directions(j) = avg + eta*Wn*dt;
        else
            directions(j) = eta*Wn*dt;
        end
    end
end

