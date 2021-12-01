%% a(R=0.82), b(R=0.84), c(R=0.86)
clc
clear
clf

N = 7;
T = 0;
P = 1;
S = 1.5;
L = 30;
mu = 0.01;
R = 0.858;

model = Model(N,T,R,P,S,L,mu);
model.populate([0, N]);
old_strats = [];

t = 0;
subplot(1,2,1)
model.plot(t)

while ~isequal(old_strats, model.strats)
    old_strats = model.strats;
    model.competition()
    model.revision()
    model.mutation([0, N])
    subplot(1,2,2)
    model.plot(t)
    pause(0.01)
    if t == 100
        break
    end
    t = t + 1;
end

subplot(1,2,2)
model.plot(t)
model.save_plot(t)