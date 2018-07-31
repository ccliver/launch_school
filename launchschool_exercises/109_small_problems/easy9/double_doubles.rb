def twice(num)
  numa = num.to_s.slice(0, num.to_s.length / 2)
  numb = num.to_s.slice(num.to_s.length / 2, num.to_s.length - 1)
  #p "#{numa} | #{numb}"
  if numa == numb and num.to_s.length > 1
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
