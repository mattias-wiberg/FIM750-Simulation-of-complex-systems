function [S,I,R] = get_SIR(world)
    S = 0;
    I = 0;
    R = 0;
    for i = 1:numel(world)
        agents = world{i};
        for j = 1:length(agents)
            switch(agents(j))
                case 1
                    S = S + 1;
                case 2
                    I = I + 1;
                case 3
                    R = R + 1;
            end
        end
    end
end

