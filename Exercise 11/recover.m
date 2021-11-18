function world = recover(world, gamma)
    infected_cells = find(cellfun(@(x) any(x==2),world) & ~cellfun(@isempty,world));
    for i = 1:length(infected_cells)
        agents = world{infected_cells(i)};
        for j = 1:length(agents)
            if agents(j) == 2 && rand < gamma
                agents(j) = 3; % Infected to recovered
            end
        end
        world{infected_cells(i)} = agents;
    end
end

