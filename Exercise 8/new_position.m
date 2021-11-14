function [x, y] = new_position(x, y, L)
    x(x < -L/2) = x + L;
    x(x > L/2) = x - L;
    y(y < -L/2) = y + L;
    y(y > L/2) = y - L;
end

