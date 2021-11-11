from game import Game

# Rule: birth criteria, survive criteria in number of alive neighbors

# started osillating after t=248 in a complex pattern periodic off
# started osillating after t=53 in a as complex pattern
# as before but now had periodic to True
rule1 = [[2], [3, 4, 5]]

# Either dies out quicky or gets stuck in still life or oscillating
rule2 = [[5, 6, 7], [2, 3]]


# Always dies out
rule3 = [[4, 5, 6, 7, 8], [4, 5]]
game = Game(rule=rule3, periodic=False)
game.populate()  # Random
i = 0
while not game.still_life() and not game.oscillating():
    #game.show(title="t = " + str(i))
    game.next_generation()
    i += 1

game.show(title="t = " + str(i))
game.next_generation()
game.show(title="t = " + str(i+1))