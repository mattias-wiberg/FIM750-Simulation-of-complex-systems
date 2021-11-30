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
%% b
clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 0.9;
L = 30;
mu = 0;

init2 = zeros(L)==1;
init2(10,10) = 1; 
init2(20,20) = 1; 

init3 = zeros(L)==1;
init3(7,7) = 1; 
init3(15,15) = 1; 
init3(15+7,15+7) = 1; 

init4 = zeros(L)==1;
init4(6,6) = 1; 
init4(2*6,2*6) = 1; 
init4(3*6,3*6) = 1; 
init4(4*6,4*6) = 1; 

init5 = zeros(L)==1;
init5(6,6) = 1; 
init5(2*6,2*6) = 1; 
init5(3*6,3*6) = 1; 
init5(4*6,4*6) = 1; 
init5(4*6,6) = 1; 

model = Model(N,T,R,P,S,L,mu);
model.populate(N);
model.strats(init5) = 0;
old_strats = [];
clims = [0 N];

imagesc(model.strats, clims)
colorbar
set(gca, 'YDir', 'Normal')
t = 0;
title(strcat("t = ", int2str(t), " R = ", num2str(R)))
saveas(gcf, strcat("t_", int2str(t), "_r_", num2str(R),'.png'))

while ~isequal(old_strats, model.strats)
    old_strats = model.strats;
    model.competition()
    model.revision()
    imagesc(model.strats, clims)
    set(gca, 'YDir', 'Normal')
    colorbar
    pause(0.1)
    %model.mutation()
    t = t + 1;
end

imagesc(model.strats, clims)
set(gca, 'YDir', 'Normal')
colorbar
title(strcat("t = ", int2str(t), " R = ", num2str(R)))
saveas(gcf, strcat("t_", int2str(t), "_r_", num2str(R),'.png'))