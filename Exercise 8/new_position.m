function positions = new_position(positions, L)
    positions(positions < -L/2) = positions(positions < -L/2) + L;
    positions(positions > L/2) = positions(positions > L/2) - L;
end

