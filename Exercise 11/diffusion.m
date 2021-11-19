function new_world = diffusion(world, L, d)
    new_world = cell(L);
    for y = 1:L
        for x = 1:L
            agents = world{y,x};
            for agent = agents
                if rand < d
                    move = randi(4);
                    switch(move)
                        case 1 % UP
                            if y + 1 > L
                                new_world{1, x} = [new_world{1, x} agent];
                            else
                                new_world{y+1, x} = [new_world{y+1, x} agent];
                            end
                        case 2 % RIGHT
                            if x + 1 > L
                                new_world{y, 1} = [new_world{y, 1} agent];
                            else
                                new_world{y, x+1} = [new_world{y, x+1} agent];
                            end
                        case 3 % DOWN
                            if y - 1 < 1
                                new_world{L, x} = [new_world{L, x} agent];
                            else
                                new_world{y-1, x} = [new_world{y-1, x} agent];
                            end
                        case 4 % LEFT
                            if x - 1 < 1
                                new_world{y, L} = [new_world{y, L} agent];
                            else
                                new_world{y, x-1} = [new_world{y, x-1} agent];
                            end
                    end
                else
                    new_world{y,x} = [new_world{y, x} agent];
                end
            end
        end
    end
end

