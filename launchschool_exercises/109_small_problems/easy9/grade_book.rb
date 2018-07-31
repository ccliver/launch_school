def get_grade(score1, score2, score3)
  grade = (score1 + score2 + score3) / 3.0
  if grade >= 90 && grade <= 100
    return 'A'
  elsif grade >= 80 && grade <= 90
    return 'B'
  elsif grade >= 70 && grade <= 80
    return 'C'
  elsif grade >= 60 && grade <= 70
    return 'D'
  else
    return 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
