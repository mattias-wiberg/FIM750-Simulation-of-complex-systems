from game import Game

glider_tl = [[1, 1, 1], [1, 0, 0], [0, 1, 0]]  # Moves top left
glider_tr = [[1, 1, 1], [0, 0, 1], [0, 1, 0]]  # Moves top right
glider_bl = [[0, 1, 0], [1, 0, 0], [1, 1, 1]]  # Moves bottom left
glider_br = [[0, 1, 0], [0, 0, 1], [1, 1, 1]]  # Moves bottom right


game = Game()
game.populate(glider_tl)
for i in range(5):
    game.show(title="t = " + str(i))
    game.next_generation()
