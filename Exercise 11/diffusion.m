function new_world = diffusion(world, L, d)
    [y,x] = find(~cellfun(@isempty,world));
    new_world = cell(L);
    for i = 1:length(x)
        agents = world{y(i),x(i)};
        for agent = agents
            if rand < d
                move = randi(4);
                switch(move)
                    case 1 % UP
                        if y(i) + 1 > L
                            new_world{1, x(i)} = [new_world{1, x(i)} agent];
                        else
                            new_world{y(i)+1, x(i)} = [new_world{y(i)+1, x(i)} agent];
                        end
                    case 2 % RIGHT
                        if x(i) + 1 > L
                            new_world{y(i), 1} = [new_world{y(i), 1} agent];
                        else
                            new_world{y(i), x(i)+1} = [new_world{y(i), x(i)+1} agent];
                        end
                    case 3 % DOWN
                        if y(i) - 1 < 1
                            new_world{L, x(i)} = [new_world{L, x(i)} agent];
                        else
                            new_world{y(i)-1, x(i)} = [new_world{y(i)-1, x(i)} agent];
                        end
                    case 4 % LEFT
                        if x(i) - 1 < 1
                            new_world{y(i), L} = [new_world{y(i), L} agent];
                        else
                            new_world{y(i), x(i)-1} = [new_world{y(i), x(i)-1} agent];
                        end
                end
            else
                new_world{y(i),x(i)} = [new_world{y(i), x(i)} agent];
            end
        end
    end
end

