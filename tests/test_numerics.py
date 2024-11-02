from timer import time_this

from math import sin
import numpy as np

# config
s, e = 123, 10_000
n = 500_000

rounds = 12

# A) pure python solution
@time_this(num_times=rounds)
def numerics_A():
  f = e / (n - 1)
  vals = [ s + f * i for i in range(n) ]
  sins = [ sin(x) for x in vals ]

  res = sum(x ** 2 for x in sins)
  return res

# B) pure python improved
@time_this(num_times=rounds)
def numerics_B():
  f = e / (n - 1)
  res = sum(sin(s + f * i) ** 2 for i in range(n))
  return res


# C) numpy solution
@time_this(num_times=rounds)
def numerics_C():
  vals = np.linspace(s, e, n)
  sins = np.sin(vals)
  
  res = (sins**2).sum()
  return res

if __name__ == "__main__":
  numerics_A()
  numerics_B()
  numerics_C()

