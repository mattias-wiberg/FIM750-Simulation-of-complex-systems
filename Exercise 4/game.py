from world import World
import numpy as np

class Game:
    #@param rule Birth criteria, survive criteria in number of alive neighbors
    def __init__(self, width = 10, height = 10, rule = ([3],[2,3])) -> None: 
        self.world = World(width, height)
        self.rule = rule
        self.birth_crit = self.rule[0]
        self.survive_crit = self.rule[1]
        self.history = [self.world.map.copy()]

    def set_rule(self, rule):
        self.rule = rule

    def wipe_world(self, width, height):
        self.world = World(width, height)
        self.history = [self.world.map.copy()]

    def next_generation(self):
        next_map = np.zeros([self.height, self.width])
        for cell in self.world.cells:
            n_alive_neighbors = len(self.world.get_alive_neighbors(cell))
            if self.world[cell]: # Alive
                if n_alive_neighbors not in self.survive_crit:
                    next_map[cell] = 0
            else: # Dead
                if n_alive_neighbors in self.birth_crit:
                    next_map[cell] = 1



