from game import Game
import imagesc as imagesc

glider_tl = [[1, 1, 1], [1, 0, 0], [0, 1, 0]]  # Moves top left
glider_tr = [[1, 1, 1], [0, 0, 1], [0, 1, 0]]  # Moves top right
glider_bl = [[0, 1, 0], [1, 0, 0], [1, 1, 1]]  # Moves bottom left
glider_br = [[0, 1, 0], [0, 0, 1], [1, 1, 1]]  # Moves bottom right


game = Game()
game.populate(glider_br)
for i in range(5):
    game.show(title="t = " + str(i))
    imagesc.savefig(game.board, "./Images/4_5/bottom_right/t_"+str(i))
    game.next_generation()
