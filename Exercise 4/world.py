import numpy as np


class World:
    def __init__(self, width, height, periodic=False):
        self.width = width
        self.height = height
        self.map = np.zeros([height, width])
        self.periodic = periodic
        # Origin, population array
        self.population_history = []
        self.cells = []
        for y in range(height):
            for x in range(width):
                self.cells.append((y, x))

    def populate(self, population=[]):
        if population == []:
            self.map = np.random.randint(0, 2, size=(self.height, self.width))
        else:
            population = np.array(population)
            h_pop = population.shape[0]
            w_pop = population.shape[1]
            x = round((self.width - w_pop) / 2)
            y = round((self.height - h_pop) / 2)
            self.map[y : y + h_pop, x : x + w_pop] = population

        self.population_history.append([(x, y), population])
        print(self.population_history[-1][0])
        print(self.population_history[-1][1])

    # 4.6
    def get_population(self):
        # bounding min, max values
        xbound = [self.width, -1]
        ybound = [self.height, -1]

        for cell in self.cells:
            if self.map[cell]:  # alive
                y = cell[0]
                x = cell[1]
                xbound[0] = x if x < xbound[0] else xbound[0]
                xbound[1] = x if x > xbound[1] else xbound[1]
                ybound[0] = y if y < ybound[0] else ybound[0]
                ybound[1] = y if y > ybound[1] else ybound[1]

        # Origin, population matrix
        return [
            (xbound[0], ybound[0]),
            self.map[ybound[0] : ybound[1] + 1, xbound[0] : xbound[1] + 1],
        ]

    def get_neighbors(self, cell):
        neighbors = []
        x = cell[0]
        y = cell[1]

        for i in range(-1, 2):
            for j in range(-1, 2):
                neighbor_x = x + j
                neighbor_y = y + i

                in_x_upperbound = neighbor_x < self.height
                in_y_upperbound = neighbor_y < self.width
                in_upperbounds = in_x_upperbound and in_y_upperbound
                is_cell = (neighbor_x, neighbor_y) == cell

                if not self.periodic:
                    positive = neighbor_x >= 0 and neighbor_y >= 0
                    if positive and in_upperbounds and not is_cell:
                        neighbors.append((neighbor_x, neighbor_y))
                else:
                    if not is_cell:
                        if not (in_x_upperbound or in_y_upperbound):
                            neighbors.append((0, 0))
                        elif not in_x_upperbound:
                            neighbors.append((0, neighbor_y))
                        elif not in_y_upperbound:
                            neighbors.append((neighbor_x, 0))
                        else:
                            neighbors.append((neighbor_x, neighbor_y))

        return neighbors

    def get_alive_neighbors(self, cell):
        alive_neighbors = []
        for neighboor in self.get_neighbors(cell):
            if self.map[neighboor]:
                alive_neighbors.append(neighboor)
        return alive_neighbors
