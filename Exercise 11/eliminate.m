function world = eliminate(world, mu)
    for i = 1:numel(world)
        new_agents = [];
        agents = world{i};
        for j = 1:length(agents)
            if agents(j) == 2
                if mu < rand % Add if not to be killed!
                    new_agents = [new_agents agents(j)];
                end
            else
                new_agents = [new_agents agents(j)];
            end
        end
        world{i} = new_agents;
    end
end

