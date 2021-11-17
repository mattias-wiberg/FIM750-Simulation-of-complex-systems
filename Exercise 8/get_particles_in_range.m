function in_range = get_particles_in_range(particles, position, L, Rf, k, fov)
    % calc differance on all particles except current one
    differance = abs(particles(:,1:2) - position);
    % Wrap around distance when over L/2
    differance(differance > L/2) = L - differance(differance > L/2);
    distance = sqrt(sum(differance.^2, 2));
    if k > 0
        [v, idx] = sort(distance);
        in_range = idx(v<Rf);
        if k < length(in_range)
            in_range = in_range(1:k);
        end
    else
        index = (1:size(particles, 1))';
        in_range = index(distance < Rf);
    end
    
    if length(nonzeros(in_range)) > 1
        % Vectors from position to all other positions in range
        v = particles(in_range(1:end), 1:2)-position;
        d_prod = position*v';
        angles = acos(d_prod./(vecnorm(v,2,2)'*norm(position)));
        angles(isnan(angles))=0; % Set positions own angle to 0
        in_range = in_range(angles < fov); % All points in the fov
    end
end
