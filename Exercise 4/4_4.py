from game import Game

blinker = [[1], [1], [1]]
toad = [[0, 1, 1, 1], [1, 1, 1, 0]]
beacon = [[1, 1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 1]]
oscillators = [blinker, toad, beacon]

game = Game()
for pop in oscillators:
    game.populate(pop)
    game.show()
    for i in range(2):
        game.next_generation()
        game.show()

    game.wipe_world()
