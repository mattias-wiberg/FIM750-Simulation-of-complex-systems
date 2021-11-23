clear;
clc;

agents = [1,2,1,1,2,3,1]
new_agents = []

for i = 1:length(agents)
    if agents(i) == 2
        if 0.5 > rand
            new_agents = [new_agents agents(i)];
        end
    else
        new_agents = [new_agents agents(i)];
    end
end
new_agents


for j = 1:length(agents)
    if agents(j) == 3 && rand < 0.01
        agents(j) = 1;
    end
end