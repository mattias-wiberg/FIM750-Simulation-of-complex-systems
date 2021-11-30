classdef Game
    %GAME All logic for the game
    %   Game is prisoners dilemma
    
    properties
        N {mustBeNumeric}
        T {mustBeNumeric}
        R {mustBeNumeric}
        P {mustBeNumeric}
        S {mustBeNumeric}
    end
    
    methods
        function obj = Game(N,T,R,P,S)
            if nargin == 5
                obj.N = N;
                obj.T = T;
                obj.R = R;
                obj.P = P;
                obj.S = S;
            end
        end
        
        function [A, B] = get_years(obj, n, m)
            %GET_YEARS gets the amount of years for each player A,B
            %   Years from two different strategies n for player A and m
            %   for player B. Where they are the specified amount of rounds
            %   to play nice.
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

