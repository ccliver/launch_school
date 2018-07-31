class Series

  def initialize(number)
    @number = number
  end

  def slices(n)
    raise ArgumentError if n > @number.length

    new_arr = []
    count = 0
    loop do
      new_arr << @number.split('').map { |x| x.to_i }[count..count + n - 1]
      break if n + count >= @number.split('').map { |x| x.to_i }.length
      count += 1 
    end
    new_arr
  end
end
