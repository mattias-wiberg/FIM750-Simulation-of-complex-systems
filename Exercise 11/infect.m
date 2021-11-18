function world = infect(world, beta)
    infected_cells = find(cellfun(@(x) any(x==2),world) & ~cellfun(@isempty,world));
    for i = 1:length(infected_cells)
        if rand < beta
            agents = world{infected_cells(i)};
            agents(agents == 1) = 2; % Infect all susceptible
            world{infected_cells(i)} = agents;
        end
    end
end

