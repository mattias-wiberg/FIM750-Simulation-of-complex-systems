# Exercise 1
## A
Fixing the opponent's strategy to m shows that the best strategy is n=m-1 this can be seen for the case of m=6 as shown below. Although for m = 0, n = m should be choosen.
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/1/a.png?raw=true)
## B
A 2D map of years in prison as a function of the player’s strategy n and the opponent’s strategy m can be seen below.
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/1/b.png?raw=true)
## C
To check if R and S has any affect on the best strategy n=m-1 the same plot was generated as in Figure 1 and the value of n giving the lowest amount of years was recorded while varying R = (T,P) and S=(P, 10]. Having m = 6 and varying R and S gave the following gif.
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/1/c.gif?raw=true)

The test was done for all other m and the best strategry was always n=m-1.
# Exercise 2
Now implementing a periodic lattice where players play the dilemma with their von Neumann neighbors.
## A
Starting from a single defector (0) in the middle and cooperators (N) everywhere else we get the following plots using N = 7, T = 0, P = 1, S = 1.5, L = 30, mu = 0.

R = [0, 0.78] the defector dies out
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_2_r_0.png?raw=true)
R = [0.79, 0.85] everything just stays as is
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_1_r_0.79.png?raw=true)
R = [0.86, 0.89] defectors make up a plus sign then stops
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_2_r_0.86.png?raw=true)
R = [0.90, 0.92] defectors make up lines in each direction
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_17_r_0.9.png?raw=true)
R = [0.93, 1] defectors take over
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_31_r_1.png?raw=true)
## B
Using different number of defectors gives the following plots using the same settings as in A but with R = 0.9.\n
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init2/t_20_r_0.9.png?raw=true)
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init3/t_17_r_0.9.png?raw=true)
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init4/t_14_r_0.9.png?raw=true)
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init5/t_17_r_0.9.png?raw=true)
## C
When placing a single cooperator in a lattice of defectors it just alawys dissapears no matter R. Same settings as in A.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/c/t_2_r_0.2.png?raw=true)
## D
Using the same settings as in A but using a 3x3 cluster of cooperators in the middle while varying R we get the following plots.
R = [0, 0.78] cooperators take over
![]()
R = [0.79, 0.85] cooperators form a rotated square
![]()
R = [0.86, 0.92] cooperators form a small star
![]()
R = [0.93, 1] cooperators form a small star
![]()
# Exercise 3

# Exercise 4

# Exercise 5
