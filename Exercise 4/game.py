import numpy as np
import imagesc as imagesc


class Game:
    # @param rule Birth criteria, survive criteria in number of alive neighbors
    def __init__(
        self, width=10, height=10, population=[], rule=([3], [2, 3]), periodic=False
    ):
        self.width = width
        self.height = height
        self.periodic = periodic
        self.rule = rule

        self.birth_crit = self.rule[0]
        self.survive_crit = self.rule[1]
        self.population_history = []
        self.world_history = []

        # Origin, population array
        self.cells = []
        for y in range(height):
            for x in range(width):
                self.cells.append((y, x))

        self.world = np.zeros([height, width])
        if population != []:
            self.populate(population)

    # 4.6
    def get_population(self):
        # bounding min, max values
        xbound = [self.width, -1]
        ybound = [self.height, -1]

        for cell in self.cells:
            if self.world[cell]:  # alive
                y = cell[0]
                x = cell[1]
                xbound[0] = x if x < xbound[0] else xbound[0]
                xbound[1] = x if x > xbound[1] else xbound[1]
                ybound[0] = y if y < ybound[0] else ybound[0]
                ybound[1] = y if y > ybound[1] else ybound[1]

        # Origin, population matrix
        return [
            (xbound[0], ybound[0]),
            self.world[ybound[0] : ybound[1] + 1, xbound[0] : xbound[1] + 1],
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
            if self.world[neighboor]:
                alive_neighbors.append(neighboor)
        return alive_neighbors

    def wipe(self):
        self.wipe_world()
        self.wipe_history()

    def wipe_world(self):
        self.world = np.zeros([self.height, self.width])
        self.world_history.append(self.world.copy())

    def wipe_history(self):
        population = self.get_population()
        self.population_history = [population]
        self.world_history = [self.world.copy()]

    def populate(self, population=[]):
        if population == []:
            self.world = np.random.randint(0, 2, size=(self.height, self.width))
        else:
            population = np.array(population)
            h_pop = population.shape[0]
            w_pop = population.shape[1]
            x = round((self.width - w_pop) / 2)
            y = round((self.height - h_pop) / 2)
            self.world[y : y + h_pop, x : x + w_pop] = population

        self.world_history.append(self.world)
        self.population_history.append(self.get_population())
        # print(self.population_history[-1][0])
        # print(self.population_history[-1][1])

    def next_generation(self):
        next_world = self.world.copy()
        for cell in self.cells:
            n_alive_neighbors = len(self.get_alive_neighbors(cell))
            if self.world[cell]:  # Alive
                if n_alive_neighbors not in self.survive_crit:
                    next_world[cell] = 0
            else:  # Dead
                if n_alive_neighbors in self.birth_crit:
                    next_world[cell] = 1

        self.world = next_world
        self.world_history.append(self.world)
        self.population_history.append(self.get_population())
        # print(self.get_population()[0])
        # print(self.get_population()[1])

    def still_life(self):
        if len(self.population_history) > 1:
            pass

    def show(self, title="Game"):
        self.board = imagesc.plot(
            self.world,
            grid=True,
            linewidth=1,
            title=title,
            cmap="Blues",
            figsize=(3, 3),
        )
