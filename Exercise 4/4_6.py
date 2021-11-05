from game import Game
import numpy as np

N = 3
config = np.random.randint(0, 2, size=(N, N))
game = Game(width=3 * N, height=3 * N, population=config)

for i in range(3):
    game.show()
    print(game.population_history)
    print(game.world_history)
    game.next_generation()
