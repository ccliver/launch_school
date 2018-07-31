require 'date'

def friday_13th(year)
  fridays = 0
  1.upto(12) do |month|
    fridays += 1 if Date.new(year, month, 13).friday?
  end
  fridays
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
