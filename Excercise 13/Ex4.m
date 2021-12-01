clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 0.84;
L = 30;
mu = 0.01;
% T < R < P < S

for R = 0.55
model = Model(N,T,R,P,S,L,mu);
model.populate([0:1:N]);
old_strats = [];

t = 0;
strat_amounts = zeros(N+1,100);

while ~isequal(old_strats, model.strats)
    old_strats = model.strats;
    model.competition()
    model.revision()
    model.mutation([0:1:N])
    %subplot(1,2,2)
    %model.plot(t)
    %pause(0.01)
    if t == 600
        break
    end
    t = t + 1;
    strat_amounts(:,t) = model.get_strat_amounts();
end

clf
subplot(1,2,1)
model.plot(t)
subplot(1,2,2)
hold on
colors = jet(N+1);
for i = 1:N+1
    plot(1:1:600, strat_amounts(i,:), 'color', colors(i,:))
end
mean(strat_amounts(8,100:end))
std(strat_amounts(8,100:end))
var(strat_amounts(8,100:end))
pbaspect([1 1 1])
%legend("0","1","2","3","4","5","6","7")
ylabel("Population fraction")
xlabel("Time")
model.save_plot(t)
end