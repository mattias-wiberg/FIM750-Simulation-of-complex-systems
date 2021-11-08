# 000 001 ... 110 111
import numpy as np
import imagesc as imagesc
import time

# Predefined rules
# cellular automata that evolve towards homogeneity (class 1),
# that evolve towards an oscillating or periodic condition (class 2),
# that display chaotic behaviors (class 3),
# and that display complex emergent behaviors (class 4).
rule_90 = [0, 1, 0, 1, 1, 0, 1, 0]  # class-4
rule_30 = [0, 1, 1, 1, 1, 0, 0, 0]  # class-3
rule_110 = [0, 1, 1, 1, 0, 1, 1, 0]  # class-4/3
rule_184 = [0, 0, 0, 1, 1, 1, 0, 1]  # class-2

# My rules
rule_94 = [0, 1, 0, 1, 1, 1, 1, 0]  # class-2
rule_88 = [0, 1, 0, 1, 1, 0, 0, 0]  # class-4
rule_255 = [1, 1, 1, 1, 1, 1, 1, 1]  # class-1
rule_165 = [1, 0, 1, 0, 0, 1, 0, 1]  # class-3


def get_next_value(rule, state):
    return rule[int("".join(map(str, state)), 2)]


def get_next_generation(rule, generation):
    next_generation = []

    state = [generation[-1]] + generation[0:2]  # Special case for first
    next_generation.append(get_next_value(rule, state))

    for i in range(1, len(generation) - 1):
        state = generation[i - 1 : i + 2]
        next_generation.append(get_next_value(rule, state))

    state = generation[i : i + 2] + [generation[0]]  # Special case for last
    next_generation.append(get_next_value(rule, state))
    return next_generation


# Rule 90/30
# generation = [0] * 30 + [1] + [0] * 30
# Rule 110/184
generation = np.random.randint(0, 2, size=(61)).tolist()
n_generations = 32
generations = []

for i in range(n_generations):
    generations.append(generation)
    generation = get_next_generation(rule_165, generation)

imagesc.plot(
    np.array(generations), grid=True, linewidth=1, title="Rule 165", cmap="Blues"
)
