def print_in_box(str)
  puts "+#{'-' * (str.length + 2)}+"
  puts "|#{' ' * (str.length + 2)}|"
  puts "| #{str} |"
  puts "|#{' ' * (str.length + 2)}|"
  puts "+#{'-' * (str.length + 2)}+"
end

print_in_box('To boldly go where no one has gone before.')
