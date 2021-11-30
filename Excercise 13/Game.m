classdef Game < handle
    %GAME All logic for the game
    %   Game is prisoners dilemma
    
    properties
        N {mustBeNumeric}
        T {mustBeNumeric}
        R {mustBeNumeric}
        P {mustBeNumeric}
        S {mustBeNumeric}
        L {mustBeNumeric}
        world
        years
    end
    
    methods
        function obj = Game(N,T,R,P,S,L)
            %if nargin == 6
            obj.N = N;
            obj.T = T;
            obj.R = R;
            obj.P = P;
            obj.S = S;
            obj.L = L;
            obj.world = zeros(L,L);
            obj.years = zeros(size(obj.world));
        end
        
        function neighbors = von_neumann_neigbors(obj,x,y)
            offsets = [
                1 -1 0 0
                0 0  1 -1];
            neighbors = [x;y] + offsets;
            % Check if in bounds with periodic conditions
            neighbors(neighbors > obj.L) = 1;
            neighbors(neighbors < 1) = obj.L;
        end
                
        function competition(obj)
            obj.years = zeros(size(obj.world));
            for y = 1:size(obj.world, 1)
                for x = 1:size(obj.world, 2)
                    n = obj.world(x,y);
                    neighbors = obj.von_neumann_neigbors(x,y);
                    for neighbor = neighbors
                        m = obj.world(neighbor(1), neighbor(2));
                        year = obj.get_years(n,m); 
                        obj.years(y, x) = obj.years(y, x) + year;
                    end
                end
            end
        end
        
        function populate(obj, range)
            obj.world = range(randi(length(range),[obj.L, obj.L]));
        end
        
        function [A, B] = get_years(obj, n, m)
            %GET_YEARS gets the amount of years for each player A,B
            %   Years from two different strategies n for player A and m
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

