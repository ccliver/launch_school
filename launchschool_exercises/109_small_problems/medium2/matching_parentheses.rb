def balanced?(str)
  parens = []
  str.chars do |ch|
    parens << ch if ch == ')' || ch == '('
  end
  
  p parens
  return false if parens.length.odd?
  return false if parens[0] == ')'
  open = 0
  close = 0
  parens.each do |paren|
    if paren == '('
      open += 1
    elsif paren == ')' && close >= open
      return false
    elsif paren == ')'
      close += 1
    end
  end
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
