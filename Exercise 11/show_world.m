function fig = show_world(world)
    scatter = zeros(size(world));
    for i = 1:numel(world)
        if ~isnan(world{i})
            scatter(i) = mode(world{i});
        end
    end
    
    map = [
        1 1 1
        0 0 1
        1 0.647 0 % Orange
        0 1 0
    ];
    fig = imagesc(scatter);
    colormap(map);
end

