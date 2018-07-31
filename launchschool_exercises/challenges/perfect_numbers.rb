class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1

    factors = []
    1.upto(number-1) { |x| factors << x if number % x == 0 }

    if factors.sum == number
      return 'perfect'
    elsif factors.sum > number
      return 'abundant'
    else
      return 'deficient'
    end
  end
end
