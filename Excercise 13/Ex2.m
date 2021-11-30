clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 0.82;
L = 3;
mu = 0;
model = Model(N,T,R,P,S,L);
model.populate([0,N]);
model.strats = [
    0 0 0
    0 N 0
    0 0 0];
model.strats
model.competition()
model.years
model.revision()
model.strats