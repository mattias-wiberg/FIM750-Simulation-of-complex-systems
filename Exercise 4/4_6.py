from game import Game


game = Game()
game.populate([[1], [1], [1]])
game.world[-1, -1] = 1
game.world[0, 0] = 1
game.get_population()
