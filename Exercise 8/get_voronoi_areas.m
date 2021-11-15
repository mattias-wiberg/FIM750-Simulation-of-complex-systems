function A = get_voronoi_areas(particles, L)
    % Expand for correct areas
    M = [particles(:,1) particles(:,2) % Has to be first for loop below
    particles(:,1)-L particles(:,2)-L
    particles(:,1)-L particles(:,2)
    particles(:,1)-L particles(:,2)+L
    particles(:,1) particles(:,2)-L
    particles(:,1) particles(:,2)+L
    particles(:,1)+L particles(:,2)-L
    particles(:,1)+L particles(:,2)
    particles(:,1)+L particles(:,2)+L];

    N = size(particles, 1);
    A = zeros(N, 1);
    [v, c] = voronoin(M(:,1:2));

    for i = 1:N
        v1 = v(c{i},1); 
        v2 = v(c{i},2);
        A(i) = polyarea(v1,v2);
    end
end