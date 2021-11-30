clc
clear

N = 10;
T = 0;
R = 0.5;
P = 1;
S = 1.5;
game = Game(N,T,R,P,S);
%% a
clf
years = zeros(1, N);
m = 6;
for i = 1:N+1
    n = i - 1;
    years(i) = game.get_years(n,m);
end
scatter(0:N, years, 'f')
xlim([0 10])
ylim([5 11])
xlabel("n")
ylabel("Years in rison")
%% b
M = zeros(N+1,N+1);
for i = 1:size(M,1)
    for j = 1:size(M,2)
        M(i,j) = game.get_years(i, j);
        fprintf("(%d, %d) ",i,j)
    end
    fprintf("\n")
end
imagesc(M)
colorbar
xlabel("m")
ylabel("n")
set(gca, 'YDir', 'Normal')
%%
clc
m = 6;
n = 1;
A = [ones(1, n), zeros(1, N-n)];
B = [ones(1, m), zeros(1, N-m)];
yearsA = 0;
yearsB = 0;
for i = 1:length(A)
    if A(i) + B(i) == 2
        yearsA = yearsA + R;
        yearsB = yearsB + R;
    elseif A(i) + B(i) == 0
        yearsA = yearsA + P;
        yearsB = yearsB + P;
    elseif A(i) == 1
        yearsA = yearsA + S;
        yearsB = yearsB + T;
    elseif B(i) == 1
        yearsA = yearsA + T;
        yearsB = yearsB + S;
    end
end



