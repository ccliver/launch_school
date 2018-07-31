def step(start_value, end_value, step)
  raise ArgumentError unless block_given?
  
  count = step
  (start_value..end_value).each do |val|
    if count == step
      yield val
      count = 1
    else
      count += 1
      next
    end
  end  
end

step(1, 10, 3) { |value| puts "value = #{value}" }
