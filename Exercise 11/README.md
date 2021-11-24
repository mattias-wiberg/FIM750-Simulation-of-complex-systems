# SIR model
To simluate Disease Spreading using a agent based SIR model.

## Code optimization
Cellfun being really slow 54 calls taking 9.349s going to try to only using 
for loops to improve should be faster.

## Exercise 1
Most of the population seems to get infected at a value of &beta; > 0.21 for &gamma; = 0.01
as can be seen in the plot below where &beta; = 0.21 and &gamma; = 0.01.
![Plot of SIR values through sim](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/1/gamma_0.01/beta_0.21.png?raw=true)
&beta; = 0.30769 and &gamma; = 0.01.
![Plot of SIR values through sim](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/1/gamma_0.01/beta_0.30769.png?raw=true)
&beta; = 0.30769 and &gamma; = 0.02.
![Plot of SIR values through sim](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/1/gamma_0.02/beta_0.30769.png?raw=true)
## Exercise 2
In the plots below it can be seen that &beta; do not only depend on &beta;/&gamma; but also on the value of &beta;
![beta gamma comp](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/2/Rinf_vs_beta.png?raw=true)
![beta gamma comp](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/2/Rinf_vs_beta_gamma.png?raw=true)

## Exercise 3
When plotting the D_&inf; as a function of &mu; using &beta; = 0.6 and &gamma; = 0.01 the following was aquired:
![mu plot](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/3/b_0.6_g_0.01.png?raw=true)
![mu plot zoom](https://github.com/klutten99/FIM750-Simulation-of-complex-systems/blob/main/Exercise%2011/3/b_0.6_g_0.01_lower.png?raw=true)
This shows that low &mu; are the most dangerous. Using the parameters &beta; = 1, &gamma; = 0.0001 &mu; = 0.003 then D_&inf; = 971 (97.1% of N) after 3 averages.

## Exercise 4