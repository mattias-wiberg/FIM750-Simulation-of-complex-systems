%% a.1
clc
clear
clf

N = 10;
T = 0;
R = 0.5;
P = 1;
S = 1.5;
game = Game(N,T,R,P,S);

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
ylabel("Years in prison")
%% b
clc
clear
clf

N = 10;
T = 0;
R = 0.5;
P = 1;
S = 1.5;
game = Game(N,T,R,P,S);

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
%% c
clc
clear
clf

N = 10;
T = 0;
P = 1;
m = 8;
steps = 10;
nBest = [];

i = 1;
for R = linspace(T+0.01,P-0.01,steps)
    j = 1;
    for S = linspace(P,10,steps)
        fprintf("%d, %d\n",R,S)
        clf
        game = Game(N,T,R,P,S);
        years = zeros(1, N);
        for k = 1:N+1
            n = k - 1;
            years(k) = game.get_years(n,m);
        end
        [~,I] = min(years);
        nBest(i,j) = I-1;
        %scatter(0:N, years, 'f')
        %title(strcat("Best n = ",int2str(I-1), ", (R,S) = (",num2str(R),', ',num2str(S), ')'))
        %xlabel("n")
        %ylabel("Years in prison")
        %pause(0.01)
        j = j + 1;
    end
    i = i +1;
end
nBest
