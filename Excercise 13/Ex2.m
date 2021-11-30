%% a
clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 1;
L = 30;
mu = 0;

model = Model(N,T,R,P,S,L,mu);
model.populate(N);
model.strats(15,15) = 0; 
old_strats = [];
clims = [0 N];

imagesc(model.strats, clims)
colorbar
set(gca, 'YDir', 'Normal')
t = 0;

while ~isequal(old_strats, model.strats)
    old_strats = model.strats;
    model.competition()
    model.revision()
    %model.mutation()
    t = t + 1;
end

imagesc(model.strats, clims)
set(gca, 'YDir', 'Normal')
colorbar
title(strcat("t = ", int2str(t), " R = ", num2str(R)))
saveas(gcf, strcat("t_", int2str(t), "_r_", num2str(R),'.png'))