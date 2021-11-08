from game import Game
import numpy as np

N = 3
game = Game(width=3 * N, height=3 * N)
found_oscillations = []

for i in range(10000):
    config = np.random.randint(0, 2, size=(N, N))
    game.populate(config)
    game.wipe_history()
    generation = 0

    while not game.still_life():
        if game.oscillating():
            break
        # print("Experiment " + str(i) + ":" + str(generation) + " Generation")
        # print(game.population_history)
        # print(game.world_history)
        game.next_generation()
        generation += 1
        if (
            game.equal_pop(
                game.population_history[0][1], game.population_history[-1][1]
            )
            and not game.still_life()
        ):
            print("Experiment " + str(i) + ":" + str(generation) + " Generation")
            game.show(
                title="Experiment " + str(i) + ":" + str(generation) + " Generation"
            )
            found_oscillations.append(game.population_history[0][1])
            break
