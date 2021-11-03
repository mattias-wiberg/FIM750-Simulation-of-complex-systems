# 000 001 ... 110 111
rule_90 = [0, 1, 0, 1, 1, 0, 1, 0]
rule_30 = [0, 1, 1, 1, 1, 0, 0, 0]
rule_110 = [0, 1, 1, 1, 0, 1, 1, 0]
rule_184 = [0, 0, 0, 1, 1, 1, 0, 1]


def get_next_value(rule, state):
    return rule[int(''.join(map(str, state)), 2)]


def get_next_generation(rule, generation):
    next_generation = []

    state = [generation[-1]]+generation[0:2]  # Special case for first
    next_generation.append(get_next_value(rule, state))

    for i in range(1, len(generation)-1):
        state = generation[i-1:i+2]
        next_generation.append(get_next_value(rule, state))

    state = generation[i:i+2] + [generation[0]]  # Special case for last
    next_generation.append(get_next_value(rule, state))
    return next_generation


generation = [0]*30+[1]+[0]*30
n_generations = 6

for gen in range(n_generations):
    print(generation)
    generation = get_next_generation(rule_90, generation)
