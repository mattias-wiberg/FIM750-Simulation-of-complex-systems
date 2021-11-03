# 000 001 ... 110 111
rule_90 = [0,1,0,1,1,0,1,0]
rule_30 = [0,1,1,1,1,0,0,0]
rule_110 = [0,1,1,1,0,1,1,0]
rule_184 = [0,0,0,1,1,1,0,1]

def get_next_value(rule, state):
    return rule[int(''.join(map(str, state)),2)] # Middle element

def get_next_generation(rule, generation):
    next_generation = []
    for i in range(len(generation)-1):
        state = generation[i-1:i+1]
        next_generation.append(get_next_value(rule, state))

    state = generation[i:i+1] + generation[0] # Special case for last
    next_generation.append(get_next_value(rule, state))
    return next_generation
    

generation = [0,0,0,1,0,0,0]
get_next_generation(rule_90, )