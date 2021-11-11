import imagesc
from matplotlib.pyplot import savefig
from game import Game

# Still life
block = [[1, 1], [1, 1]]
beehive = [[0, 1, 0], [1, 0, 1], [1, 0, 1], [0, 1, 0]]
loaf = [[0, 1, 0, 0], [1, 0, 1, 0], [1, 0, 0, 1], [0, 1, 1, 0]]
boat = [[0, 1, 0], [1, 0, 1], [0, 1, 1]]
tub = [[0, 1, 0], [1, 0, 1], [0, 1, 0]]
still_life = [block, beehive, loaf, boat, tub]

# Oscillators
blinker = [[1], [1], [1]]
toad = [[0, 1, 1, 1], [1, 1, 1, 0]]
beacon = [[1, 1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 1]]
oscillators = [blinker, toad, beacon]

game = Game()
# %% Still life plotting
for pop in still_life:
    game.wipe_world()
    game.populate(pop)
    game.show()
    game.next_generation()
    game.show()

# %% Osillators plotting
for pop in oscillators:
    game.wipe_world()
    game.populate(pop)
    game.show()
    for i in range(3):
        game.next_generation()
        game.show()

game = Game(periodic=True)
game.wipe_world()
game.populate()
for i in range(20):
    game.show("t="+str(i))
    imagesc.savefig(game.board, "./Images/4_2/periodic/t_"+str(i))
    game.next_generation()
# get_neighbors(world, (9,9), True)
# 8,8 9,8 0,8
# 8,9 9,9 0,9
# 8,0 9,0 0,0

# %%
