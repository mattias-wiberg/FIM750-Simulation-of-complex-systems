# Exercise 1
## A
Fixing the opponent's strategy to m shows that the best strategy is n=m-1 this can be seen for the case of m=6 as shown below. Although for m = 0, n = m should be choosen.\
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/1/a.png?raw=true)
## B
A 2D map of years in prison as a function of the player’s strategy n and the opponent’s strategy m can be seen below.
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/1/b.png?raw=true)
## C
To check if R and S has any affect on the best strategy n=m-1 the same plot was generated as in Figure 1 and the value of n giving the lowest amount of years was recorded while varying R = (T,P) and S=(P, 10]. Having m = 6 and varying R and S gave the following gif.\
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/1/c.gif?raw=true) \
The test was done for all other m and the best strategry was always n=m-1.
# Exercise 2
Now implementing a periodic lattice where players play the dilemma with their von Neumann neighbors.
## A
Starting from a single defector (0) in the middle and cooperators (N) everywhere else we get the following plots using N = 7, T = 0, P = 1, S = 1.5, L = 30, mu = 0.

R = [0, 0.78] the defector dies out
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_2_r_0.png?raw=true) \
R = [0.79, 0.85] everything just stays as is
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_1_r_0.79.png?raw=true) \
R = [0.86, 0.89] defectors make up a plus sign then stops
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_2_r_0.86.png?raw=true) \
R = [0.90, 0.92] defectors make up lines in each direction
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_17_r_0.9.png?raw=true) \
R = [0.93, 1] defectors take over
![alt text](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/a/t_31_r_1.png?raw=true)
## B
Using different number of defectors gives the following plots using the same settings as in A but with R = 0.9.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init2/t_20_r_0.9.png?raw=true)
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init3/t_17_r_0.9.png?raw=true)
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init4/t_14_r_0.9.png?raw=true)
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/b/init5/t_17_r_0.9.png?raw=true)
## C
When placing a single cooperator in a lattice of defectors it just alawys dissapears no matter R. Same settings as in A.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/c/t_2_r_0.2.png?raw=true)
## D
Using the same settings as in A but using a 3x3 cluster of cooperators in the middle while varying R we get the following plots.
Inital
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/d/t_0_r_0.png?raw=true) \
R = [0, 0.78] cooperators spread
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/d/t_29_r_0.78.png?raw=true) \
R = [0.79, 0.85] cooperators form a rotated square and stay stable
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/d/t_20_r_0.79.png?raw=true) \
R = [0.86, 0.92] cooperators form a small star and stay stable
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/d/t_2_r_0.86.png?raw=true) \
R = [0.93, 1] cooperators vanish
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/2/d/t_4_r_0.93.png?raw=true)
# Exercise 3
## A
R = 0.82
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/a.png?raw=true)
## B
R = 0.84
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/b.png?raw=true)
## C
R = 0.86
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/c.png?raw=true)
## D
Having S = 1.5, P = 1, T = 0, N = 7
R = [0, 78]
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/d/t_100_r_0.78.png?raw=true) \
R = [0.79, 0.83]
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/d/t_100_r_0.83.png?raw=true) \
R = [0.84, 0.85]
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/d/t_100_r_0.84.png?raw=true) \
R = [0.86, 0.88]
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/d/t_100_r_0.88.png?raw=true) \
R = [0.89, 1]
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/d/t_100_r_1.png?raw=true)
## E
Having R = 0.84, P = 1, T = 0, N = 7
S = [0, 1.35] cooperators spread
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/e/t_100_r_0.84_s_1.35.png?raw=true) \
S = [1.36, 1.61] cooperation coexists with defection
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/e/t_100_r_0.84_s_1.61.png?raw=true) \
S = [1.62, 2.35] defection takes over but still coexists with cooperation
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/e/t_100_r_0.84_s_2.35.png?raw=true) \
S = 2.36 defection takes over even more but some cooperation still remains
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/e/t_100_r_0.84_s_2.36.png?raw=true) \
S = [2.37, 5] defection takes over
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/3/e/t_100_r_0.84_s_5.png?raw=true)
# Exercise 4
It is clear that in the beginning R = [0, 0.16] the dominant strategy is cooperation specifically for 7.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.16_s_1.5.png?raw=true) \
When R increases even further R > 0.16 the cooperation for 6 rounds joins the dominance
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.21_s_1.5.png?raw=true) \
and when R is increased even further R = [0.2, 0.46] the cooperation for 5 rounds joins the dominance.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.36_s_1.5.png?raw=true) \
For R = [0.47, 0.71] strategies 3,4 and 2 slowly join the dominance.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.51_s_1.5.png?raw=true) \
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.56_s_1.5.png?raw=true) \
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.61_s_1.5.png?raw=true) \
At R = 0.71 all different strategies are dominant but at different times and leads to oscillation of the different distributions. On the 2D plot it shows that different regions are formed. Although at times defection takes over.
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.71_s_1.5.png?raw=true) \
After R > 0.72 defection(0) usually spreads and takes over
![](https://github.com/mattias-wiberg/FIM750-Simulation-of-complex-systems/blob/main/Excercise%2013/4/t_100_r_0.81_s_1.5.png?raw=true)

At low R < 0.16 you could say that cooperation(7) is the evolutionary stable strategies but at higher R > 0.72 defection(0) seems to be the only evolutionary stable strategy. In between R = [0.16, 0.71] no strategry seems to be evolutionary stable but at times defection(0) can take over as mentioned above.
# Exercise 5
## A

## B

