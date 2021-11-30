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

t = 0;
model.plot(t)

while ~isequal(old_strats, model.strats)
    old_strats = model.strats;
    model.competition()
    model.revision()
    t = t + 1;
end

model.plot(t)
model.save_plot(t)
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

t = 0;
subplot(1,2,1)
model.plot(t)
while ~isequal(old_strats, model.strats)
    old_strats = model.strats;
    model.competition()
    model.revision()
    t = t + 1;
end
subplot(1,2,2)
model.plot(t)
model.save_plot(t)
%% c/d
clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 0.8;
L = 30;
mu = 0;

init = zeros(L)==1;
init(15-1:15+1,15-1:15+1) = 1; 
%init(15,15) = 1;
for R = 0.2
    model = Model(N,T,R,P,S,L,mu);
    model.populate(0);
    model.strats(init) = N;
    old_strats = [];
    t = 0;
    subplot(1,2,1)
    model.plot(t)

    while ~isequal(old_strats, model.strats)
        old_strats = model.strats;
        model.competition()
        model.revision()
        %model.plot(t)
        %pause(0.01)
        %model.mutation()
        t = t + 1;
    end
    subplot(1,2,2)
    model.plot(t)
    pause(0.02)
    model.save_plot(t)
end