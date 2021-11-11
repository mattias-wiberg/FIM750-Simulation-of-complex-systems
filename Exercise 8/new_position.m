function [new_x, new_y] = new_position(x, y, L)
    if x < -L/2
        new_x = x + L;
    elseif x > L/2
        new_x = x - L;
    else
        new_x = x;
    end
    
    if y < -L/2
        new_y = y + L;
    elseif y > L/2
        new_y = y - L;
    else
        new_y = y;
    end
end

