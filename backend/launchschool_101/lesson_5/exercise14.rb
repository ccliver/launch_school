hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []
hsh.each do |k, v|
  if v[:type] == 'fruit'
    puts v[:colors].each_with_index { |_, index| v[:colors][index].capitalize! }
    arr << v[:colors]
  else
    arr << v[:size].upcase!
  end
end

puts arr.inspect