function world = demmune(world, alpha)
    for i = 1:numel(world)
        for j = 1:length(world{i})
            if world{i}(j) == 3 && rand < alpha
                world{i}(j) = 1;
            end
        end
    end
end

