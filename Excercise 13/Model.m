classdef Model < handle
    %GAME All logic for the game
    %   Game is prisoners dilemma
    
    properties
        N {mustBeNumeric}
        T {mustBeNumeric}
        R {mustBeNumeric}
        P {mustBeNumeric}
        S {mustBeNumeric}
        L {mustBeNumeric}
        mu
        strats
        years
    end
    
    methods
        function obj = Model(N,T,R,P,S,L,mu)
            %if nargin == 6
            obj.N = N;
            obj.T = T;
            obj.R = R;
            obj.P = P;
            obj.S = S;
            obj.L = L;
            obj.mu = mu;
            obj.strats = zeros(L,L);
            obj.years = zeros(size(obj.strats));
        end
        
        function neighbors = von_neumann_neigbors(obj,y,x)
            offsets = [
                1 -1 0 0
                0 0  1 -1];
            neighbors = [y;x] + offsets;
            % Check if in bounds with periodic conditions
            neighbors(neighbors > obj.L) = 1;
            neighbors(neighbors < 1) = obj.L;
        end
            
        function revision(obj)
            new_strats = obj.strats;
            for y = 1:size(obj.strats, 1)
                for x = 1:size(obj.strats, 2)
                    min_years = obj.years(y, x);
                    neighbors = obj.von_neumann_neigbors(y,x);
                    for neighbor = neighbors
                        ny = neighbor(1);
                        nx = neighbor(2);
                        if obj.years(ny, nx) < min_years
                            min_years = obj.years(ny, nx);
                            new_strats(y, x) = obj.strats(ny, nx);
                        end
                    end
                end
            end
            obj.strats = new_strats;
        end
        
        function mutation(obj, range)
            for i = 1:numel(obj.strats)
                if rand < obj.mu
                    choices = range(range~=obj.strats(i));
                    obj.strats(i) = choices(randi(length(choices)));
                end
            end
        end
        
        function competition(obj)
            obj.years = zeros(size(obj.strats));
            for y = 1:size(obj.strats, 1)
                for x = 1:size(obj.strats, 2)
                    n = obj.strats(y,x);
                    neighbors = obj.von_neumann_neigbors(y,x);
                    for neighbor = neighbors
                        m = obj.strats(neighbor(1), neighbor(2));
                        year = obj.get_years(n,m); 
                        obj.years(y, x) = obj.years(y, x) + year;
                    end
                end
            end
        end
        
        function plot(obj, t)
            clims = [0 obj.N];
            %heatmap(obj.strats)
            imagesc(obj.strats, clims)
            colorbar
            pbaspect([1 1 1])
            set(gca, 'YDir', 'Normal')
            title(strcat("t = ", int2str(t), " R = ", num2str(obj.R)))
        end
        
        function save_plot(obj, t)
            saveas(gcf, strcat("t_", int2str(t), "_r_", num2str(obj.R),'.png'))        
        end
            
        function populate(obj, range)
            obj.strats = range(randi(length(range),[obj.L, obj.L]));
        end
        
        function [A, B] = get_years(obj, n, m)
            %GET_YEARS gets the amount of years for each player A,B
            %   Years from two different strats n for player A and m
            %   for player B.
            A = min(m,n) * obj.R;
            B = A;
            if n > m
                A = A + obj.S;
                B = B + obj.T;
            elseif n < m 
                A = A + obj.T;
                B = B + obj.S;
            else
                A = A + obj.P;
                B = B + obj.P;
            end
            roundsLeft = obj.N - (min(m,n) + 1);
                
            A = A + roundsLeft * obj.P;
            B = B + roundsLeft * obj.P;
        end
    end
end

