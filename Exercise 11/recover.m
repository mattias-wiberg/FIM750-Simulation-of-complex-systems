function world = recover(world, gamma)
    for i = 1:numel(world)
        if any(world{i} == 2) % Contains any infected
            agents = world{i};
            for j = 1:length(agents)
                if agents(j) == 2 && rand < gamma
                    agents(j) = 3; % Infected to recovered
                end
            end
            world{i} = agents;
        end
    end
end

