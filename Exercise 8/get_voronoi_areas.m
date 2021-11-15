function A = get_voronoi_areas(v, c)
    A = zeros(length(c),1);
    for i = 1:length(c)
        v1 = v(c{i},1); 
        v2 = v(c{i},2);
        A(i) = polyarea(v1,v2);
    end
end