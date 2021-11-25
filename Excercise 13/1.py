import numpy as np
import imagesc

N=10
T=0
R=0.5
P=1
S=1.5

def get_years(n,m) -> int:
    years = min(m,n) * R
    if n > m:
        years += abs(m-n) * S
    else:
        years += abs(m-n) * T
    years += (N - max(m,n)) * P
    return years

M = np.zeros((N+1,N+1))

for m in range(N+1):
    for n in range(N+1):
        M[n, m] = get_years(N-n, m)
imagesc.plot(M, [10,9,8,7,6,5,4,3,2,1,0], [0,1,2,3,4,5,6,7,8,9,10])

print(M)
