from game import Game
import numpy as np

# Rule: birth criteria, survive criteria in number of alive neighbors

voting_rule = [[5, 6, 7, 8], [4, 5, 6, 7, 8]]
height = 100
width = 100
game = Game(width, height, rule=voting_rule, periodic=True)
p = 0.6  # Chance of a 1

i = 0
game.populate(np.where(p > np.random.rand(height, width), 1, 0))  # Random
game.show(title="t = " + str(i), grid=False)
while not game.still_life():
    game.next_generation()
    i += 1
    print(i)

game.show(title="t = " + str(i), grid=False)
pop_sum = game.world.sum()
total = height * width
print("Number of 1s: " + str(pop_sum) + '('+str(pop_sum/total*100)+'%)', ", 0s: " + str(total - pop_sum) + ' ('+str((1-(pop_sum/total))*100)+'%)')
