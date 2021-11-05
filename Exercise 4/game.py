from world import World
import numpy as np
import imagesc as imagesc


class Game:
    # @param rule Birth criteria, survive criteria in number of alive neighbors
    def __init__(self, width=10, height=10, rule=([3], [2, 3]), periodic=False) -> None:
        self.world = World(width, height)
        self.map_history = [self.world.map.copy()]
        self.rule = rule
        self.birth_crit = self.rule[0]
        self.survive_crit = self.rule[1]
        self.periodic = periodic

    def set_rule(self, rule):
        self.rule = rule

    def wipe_world(self):
        self.world.map = np.zeros([self.world.height, self.world.width])
        self.map_history = [self.world.map.copy()]

    def new_world(self, width, height):
        self.world = World(width, height, self.periodic)
        self.map_history = [self.world.map.copy()]

    def next_generation(self):
        next_map = self.world.map.copy()
        for cell in self.world.cells:
            n_alive_neighbors = len(self.world.get_alive_neighbors(cell))
            if self.world.map[cell]:  # Alive
                if n_alive_neighbors not in self.survive_crit:
                    next_map[cell] = 0
            else:  # Dead
                if n_alive_neighbors in self.birth_crit:
                    next_map[cell] = 1

        self.world.map = next_map
        self.map_history.append(next_map)
        print(self.world.get_population()[0])
        print(self.world.get_population()[1])

    def show(self, title="Game"):
        self.board = imagesc.plot(
            self.world.map,
            grid=True,
            linewidth=1,
            title=title,
            cmap="Blues",
            figsize=(3, 3),
        )
