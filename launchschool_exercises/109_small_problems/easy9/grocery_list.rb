def buy_fruit(list)
  new_list = []
  list.each do |fruit|
    fruit[1].times { new_list << fruit[0] }
  end
  new_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
