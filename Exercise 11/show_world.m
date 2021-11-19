function fig = show_world(world)
    scatter = cellfun(@mode, world); % Most occurences
    %scatter = cellfun(@mean, world); % Mean of cell agent types
    scatter(isnan(scatter)) = 0;
    map = [
        1 1 1
        0 0 1
        1 0.647 0 % Orange
        0 1 0
    ];
    fig = imagesc(scatter);
    colormap(map);
end

