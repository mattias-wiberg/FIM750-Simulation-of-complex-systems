function [S, I, R, t] = simulation(L, N, ifr, d, beta, gamma, mu, alpha)
    t = 0;
    S = [];
    I = [];
    R = [];
    world = init_world(L, N, ifr);
    while any_infected(world)
        world = diffuse(world, L, d);
        world = infect(world, beta);
        world = recover(world, gamma);
        world = eliminate(world, mu); % Exercise 3
        %world = demmune(world, alpha); % Exercise 4
        t = t + 1;
        [nS, nI, nR] = get_SIR(world);
        S = [S nS];
        I = [I nI];
        R = [R nR];
        if mod(t,25) == 0
            %show_world(world);
            %title(strcat('t = ', int2str(t)))
            %pause(0.01)
        end
    end
end

