import numpy as np


def get_neighbors(world, cell, periodic=False):
    neighbors = []
    x = cell[0]
    y = cell[1]
    height = len(world[0,:])
    width = len(world[:,0])

    for i in range(-1,2):
        for j in range(-1,2):
            neighbor_x = x+j
            neighbor_y = y+i

            in_x_upperbound = neighbor_x < height
            in_y_upperbound = neighbor_y < width
            in_upperbounds = in_x_upperbound and in_y_upperbound
            is_cell = (neighbor_x,neighbor_y)==cell

            if not periodic:
                positive = neighbor_x >= 0 and neighbor_y >= 0
                if positive and in_upperbounds and not is_cell:
                    neighbors.append((neighbor_x, neighbor_y))
            else:
                if not is_cell:
                    if not (in_x_upperbound or in_y_upperbound):
                        neighbors.append((0,0))
                    elif not in_x_upperbound:
                        neighbors.append((0, neighbor_y))
                    elif not in_y_upperbound:
                        neighbors.append((neighbor_x,0))
                    else:
                        neighbors.append((neighbor_x, neighbor_y))
                    
    return neighbors

def get_alive_neighbors(world, cell):
    alive_neighbors = []
    for neighboor in get_neighbors(world, cell):
        if world[cell]:
            alive_neighbors.append(neighboor)
    return alive_neighbors

def populate(world, population=[]):
    height = len(world[0,:])
    width = len(world[:,0])

    if population == []:
        world = np.random.randint(0, 2, size=(height, width))
    else:
        population = np.array(population)
        w_pop = len(population[:,0])
        h_pop = len(population[0,:])
        x = round((width-w_pop)/2)
        y = round((height-h_pop)/2)
        world[y:y+h_pop, x:x+w_pop] = population

def next_generation(world, rule):
    
    ...

def get_world(width, height):
    return np.zeros([height, width])

width = 10
height = 10
world = get_world(width, height)
get_neighbors(world, (0,0), True)
populate(world, [[1,1],[1,1]])
# Birth criteria, survive criteria
rule = ([3], [2,3])
#get_neighbors(world, (9,9), True)
# 8,8 9,8 0,8
# 8,9 9,9 0,9
# 8,0 9,0 0,0