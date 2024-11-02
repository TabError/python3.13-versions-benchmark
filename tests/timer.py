from time import perf_counter_ns
from time import process_time_ns

from functools import wraps as wraps_func

# use time.perf_counter() and time.process_time()


def time_this(_func = None, *, num_times=1, callback=None):
  def decorator_time_this(func):
    @wraps_func(func)
    def newf(*args, **kwargs):
      perf_start = perf_counter_ns()
      proc_start = process_time_ns()

      for _ in range(num_times):
        res = func(*args, **kwargs)

      perf_end = perf_counter_ns()
      proc_end = process_time_ns()

      perf_span = (perf_end - perf_start) / 1_000_000
      proc_span = (proc_end - proc_start) / 1_000_000
      perf_span /= num_times
      proc_span /= num_times

      if callback is None:
        print(f"Took: {perf_span:.3f}ms | {proc_span:.3f}ms")
      else:
        callback((perf_span, proc_span))

      return res
    return newf
  
  if _func is None:
    return decorator_time_this
  else:
    return decorator_time_this(_func)

@time_this(num_times=5)
def example():
  for i in range(int(1e7)):
    pass
  l = [...] * 30

