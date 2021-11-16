function directions = update_directions(particles, L, Rf, eta, dt)
    N = size(particles, 1);
    directions = zeros(N, 1);
    for j = 1:N
        % calc differance on all particles except current one
        differance = abs(particles(:,1:2) - particles(j, 1:2));
        % Wrap around distance when over L/2
        differance(differance > L/2) = L - differance(differance > L/2); 
        
        in_range = sqrt(sum(differance.^2, 2)) < Rf;
        % Circular mean https://en.wikipedia.org/wiki/Circular_mean
        alpha = particles(in_range, 3);
        if sum(in_range) > 1
            avg = atan(mean(sin(alpha))/mean(cos(alpha)));
        else
            avg = alpha;
        end
        Wn = rand()-0.5;
        directions(j) = avg + eta*Wn*dt;
    end
    
end

