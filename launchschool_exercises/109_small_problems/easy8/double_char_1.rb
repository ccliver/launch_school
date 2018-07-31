def repeater(str)
  new_str = []
  str.chars.each do |ch|
    new_str << ch << ch
  end
  new_str.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
