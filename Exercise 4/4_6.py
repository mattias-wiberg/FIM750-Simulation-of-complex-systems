from game import Game
import numpy as np


def in_collection(array, needle):
    for population in array:
        if game.equal_pop(population, needle):
            return True
    return False


N = 3
searches = 10000
game = Game(width=3 * N, height=3 * N)
found_oscillations = []

for i in range(searches):
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
        population = game.population_history[0][1]
        if (
            game.equal_pop(population, game.population_history[-1][1])
            and not game.still_life()
        ):
            if not in_collection(found_oscillations, population):
                print("Experiment " + str(i) + ":" + str(generation) + " Generation")
                game.show(
                    title="Experiment " + str(i) + ":" + str(generation) + " Generation"
                )
                found_oscillations.append(population)
            break

    print(i)
