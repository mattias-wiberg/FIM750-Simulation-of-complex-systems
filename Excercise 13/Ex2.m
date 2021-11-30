clc
clear

N = 7;
T = 0;
P = 1;
S = 1.5;
R = 0.82;
L = 3;
mu = 0;
game = Game(N,T,R,P,S,L);
game.populate([0,N]);
game.competition()
game.world
game.years