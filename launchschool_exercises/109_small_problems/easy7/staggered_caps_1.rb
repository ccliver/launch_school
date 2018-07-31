def staggered_case(str)
  cap = true
  str.split('').map do |ch|
    if cap
      cap = false
      ch.upcase
    elsif ! cap
      cap = true
      ch.downcase
    else
      ch
    end
  end.join
end

p staggered_case('I Love Launch School!') # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') # == 'IgNoRe 77 ThE 444 NuMbErS'
