class SumOfMultiples
  def self.to(divisors = [3, 5], limit)
    result = 1.upto(limit - 1).select { |number| divisors.any? { |divisor| number % divisor == 0 } }.reduce(:+)
    return 0 if result.nil?
    result
  end

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    self.class.to(@divisors, limit)
  end
end
