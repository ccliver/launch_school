class Luhn
  attr_reader :addends, :checksum

  def initialize(id)
    @id = id
    @addends = compute_addends
    @checksum = self.addends.reduce(:+)
  end

  def valid?
    self.checksum % 10 == 0
  end

  def self.create(number)
    0.upto(9) do |check_digit|
      num_with_check_digit = (number.digits.reverse << check_digit).join.to_i
      luhn_id = Luhn.new(num_with_check_digit)
      return num_with_check_digit if luhn_id.valid?
    end
  end

  def compute_addends(number = @id)
    addends = []
    check = false
    number.digits.each do |digit|
      if check
        if digit * 2 >= 10
          addends << (digit * 2) - 9
        else
          addends << (digit * 2)
        end
        check = false
      else
        addends << digit
        check = true
      end
    end
    addends.reverse
  end
end
