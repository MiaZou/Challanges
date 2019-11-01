module Luhn
  def self.is_valid_old?(number)
    num = number.to_s.chars.map(&:to_i)
    num_rev = num.reverse!
    sum = 0
    num_rev.each do |x|
      n = num_rev.index(x).to_i
      if n % 2 == 1
        a = x*2
        if a < 10
          sum += a
        else
          a = a-9
          sum += a
        end
      else
        sum += x
      end
    end
    if sum % 10 == 0
      return true
    else
      return false
    end
  end

  def self.is_valid?(n) 
    return n.to_s.scan(/\d/).reverse.each.with_index(1).map do |c,i|
      if i % 2 == 0 then
        nc = c.to_i * 2
        nc = nc.to_s.scan(/\d/).map(&:to_i).sum if nc > 9
      else
        c
      end
    end.sum % 10 == 0
  end
end