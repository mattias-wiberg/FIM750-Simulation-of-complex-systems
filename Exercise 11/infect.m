function world = infect(world, beta)
    for i = 1:numel(world)
        if rand < beta && any(world{i}==2) % Contains any infected
            agents = world{i};
            agents(agents == 1) = 2; % Infect all susceptible
            world{i} = agents;
        end
    end
end

