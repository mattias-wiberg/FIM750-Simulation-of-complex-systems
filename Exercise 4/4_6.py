from game import Game
import numpy as np

N = 3
game = Game(width=3 * N, height=3 * N)
config = np.random.randint(0, 2, size=(N, N))
game.populate(config)

for i in range(3):
    game.show()
    print(game.population_history)
    print(game.world_history)
    game.next_generation()
