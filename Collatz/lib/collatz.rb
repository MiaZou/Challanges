module Collatz
  class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
  end

  def self.collatz(n)
    return 1 if n == 1
    return 1 + collatz(n/2) if n%2 ==0
    return 1 + collatz(n*3+1)
  end
  
  # collatz(3)   => 1 + collatz(10)
  # collatz(10)  => 1 + 1 + collatz(5)
  # collatz(5)   => 1 + 1 + 1 + collatz(16)
  # collatz(16)  => 1 + 1 + 1 + 1 + collatz(8)
  # collatz(8)   => 1 + 1 + 1 + 1 + 1 + collatz(4)
  # collatz(4)   => 1 + 1 + 1 + 1 + 1 + 1 + collatz(2)
  # collatz(2)   => 1 + 1 + 1 + 1 + 1 + 1 + 1 + collatz(1)
  # collatz(1)   => 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1
  #              => 1 + 1 + 1 + 1 + 1 + 1 + 2
  #              => 1 + 1 + 1 + 1 + 1 + 3
  #              => 1 + 1 + 1 + 1 + 4
  #              => 1 + 1 + 1 + 5
  #              => 1 + 1 + 6
  #              => 1 + 7
  #              => 8

  def self.find_longest(num)
    longest = Integer::MIN
    longest_input = 0
    num.times do |i|
      n=i+1
      r = collatz(n)
      if r > longest then
        longest = r
        longest_input = n
      end
    end
    return longest, longest_input
  end

end
