import imagesc as imagesc
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
periods = []
shifts = []
velocities = []

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
        inital_population = game.population_history[0]
        current_population = game.population_history[-1]
        if (
            game.equal_pop(inital_population[1], current_population[1])
            and not game.still_life()
        ):
            if not in_collection(found_oscillations, inital_population[1]):
                print("Experiment " + str(i) + ":" + str(generation) + " Generation")
                game.show(
                    title="Experiment " + str(i) + ":" + str(generation) + " Generation"
                )
                for pop in game.population_history[0:-1]:
                    k = len(game.population_history)-1
                    shift = np.array(current_population[0])-np.array(inital_population[0])
                    s = np.sqrt(sum(np.power(shift, 2)))
                    v = s / k
                    found_oscillations.append(pop[1]) # add array
                    periods.append(k)
                    velocities.append(v)
                    shifts.append(shift)
                    
            break
#%%
for i in range(len(found_oscillations)):
    game.wipe_world()
    game.populate(found_oscillations[i])
    title = "k="+str(periods[i])+" s="+str(shifts[i])+" v="+str(velocities[i])
    game.show(title)
    imagesc.savefig(game.board, "./Images/4_6/"+str(i)+"_"+str(periods[i]))
