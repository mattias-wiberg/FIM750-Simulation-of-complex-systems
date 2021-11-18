function world = init_world(L, N, ifr)
    nS = ceil(N-N*ifr);
    nI = floor(N*ifr);
    population = shuffle([ones(nS, 1); ones(nI, 1)*2]);
    world = cell(L);
    for i = 1:N
        x = randi(L);
        y = randi(L);
        world{y, x} = [world{y, x} population(i)];
    end
end

