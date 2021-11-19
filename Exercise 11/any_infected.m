function result = any_infected(world)
    result = false;
    for i = 1:numel(world)
        if any(world{i}==2) % Any agent in cell infected
            result = true;
            return
        end
    end
end

