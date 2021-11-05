from game import Game
import numpy as np

N = 3
game = Game(3 * N, 3 * N)
config = np.random.randint(0, 2, size=(N, N))
game.populate(config)
game.show()
game.population_history
