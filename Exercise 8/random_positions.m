function particles = random_positions(N, L)
    a = L/2;
    b = -L/2;
    particles = a + (b-a).*rand(N,2);
end

