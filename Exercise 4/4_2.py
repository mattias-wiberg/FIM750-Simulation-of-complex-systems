from game import Game

game = Game()
game.world.populate([[1,1],[1,1]])
game.show()
game.next_generation()
#get_neighbors(world, (9,9), True)
# 8,8 9,8 0,8
# 8,9 9,9 0,9
# 8,0 9,0 0,0