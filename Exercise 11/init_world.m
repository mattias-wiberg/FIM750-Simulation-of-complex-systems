function world = init_world(L)
    world = cell(L);
    for i = 1:N
        x = randi(L);
        y = randi(L);
        world{x, y} = [world{x, y} randi(3)];
    end
end

