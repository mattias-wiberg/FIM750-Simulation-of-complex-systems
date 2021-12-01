clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 0.84;
L = 30;
mu = 0.01;
range = [0:1:N];
% T < R < P < S
t_min = 100;
t_record = 500;
t_max = t_min + t_record;
steps = 2;

strats_vars = [];

for R = linspace(0.01,0.99,steps)
    for S = linspace(1.01,4,steps)
        strat_amounts = zeros(N+1,t_record,1);
        model = Model(N,T,R,P,S,L,mu);
        model.populate(range);

        for t = 1:1:t_max
            if t > t_min
                strat_amounts(:,t-t_min) = model.get_strat_amounts();
            end
            model.competition()
            model.revision()
            model.mutation(range)
            if t == t_max
                break
            end
        end
    end
end