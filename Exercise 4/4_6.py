from game import Game


game = Game()
game.world.populate([[1], [1], [1]])
game.world.map[-1, -1] = 1
game.world.map[0, 0] = 1
game.world.get_population()
