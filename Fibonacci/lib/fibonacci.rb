module Fibonacci
  @@memo = [0,1,1]
  def self.recursive_fib(n)
    return 0 if n == 0
    return 1 if n <= 2
    return recursive_fib(n-1) + recursive_fib(n-2)
  end
  def self.recursive_with_memo(n)
    if @@memo[n] then
      return @@memo[n]
    end
    @@memo[n] = recursive_with_memo(n-1) + recursive_with_memo(n-2)
  end
end

module Fibonacci
  def self.iterative_fib_old(n)
    if n == 0
      return 0
    elsif n == 1 || n == 2
      return 1
    end
    prev_2 = 0
    prev_1 = 1
    sum = 0
    (0...n).each do |x|
      prev_2 = prev_1
      prev_1 = sum
      sum = prev_1 + prev_2
    end
    return sum
  end
  def self.iterative_fib(n)
    k_1 = 0
    k_2 = 0
    f = 0
    (1...n+1).each do |k|
      if k <= 2
        f = 1
      else
        f = k_1 + k_2
      end
      k_1 = k_2
      k_2 = f
    end
    return f
  end
  def self.bench
    require 'benchmark'
    num = 35
    Benchmark.bm do |x|
      x.report("recursive_fib") { self.recursive_fib(num) }
      x.report("iterative_fib")  { self.iterative_fib(num)  }
      x.report("recursive_with_memo")  { self.recursive_with_memo(num)  }
    end
  end
end




