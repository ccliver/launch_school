class Trinary
  def initialize(number)
    @number = number.to_i
  end

  def to_decimal
    total = 0
    @number.digits.each_with_index do |digit, idx|
      return 0 if digit >= 3

      total += digit * (3**idx)
    end
    total
  end
end
