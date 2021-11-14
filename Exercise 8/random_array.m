function array = random_array(size, lower, upper)
    array = lower + (upper - lower).*rand(size);
end

