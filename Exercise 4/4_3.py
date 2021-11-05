from game import Game

block = [[1, 1], [1, 1]]
beehive = [[0, 1, 0], [1, 0, 1], [1, 0, 1], [0, 1, 0]]
loaf = [[0, 1, 0, 0], [1, 0, 1, 0], [1, 0, 0, 1], [0, 1, 1, 0]]
boat = [[0, 1, 0], [1, 0, 1], [0, 1, 1]]
tub = [[0, 1, 0], [1, 0, 1], [0, 1, 0]]
still_life = [block, beehive, loaf, boat, tub]

game = Game()
for pop in still_life:
    game.populate(pop)
    game.show()
    game.next_generation()
    game.show()
    game.wipe_world()
