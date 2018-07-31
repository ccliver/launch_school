def center_of(str)
  if str.length % 2 == 0
    str[str.length / 2 - 1..str.length / 2]
  else
    str[str.length / 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
