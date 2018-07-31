class School
  def initialize
    @grades = {}
  end

  def add(name, grade)
    if @grades.has_key? grade
      @grades[grade] << name
      @grades[grade].sort!
    else
      @grades[grade] = [name]
    end
  end

  def grade(grade)
    return [] if @grades[grade].nil?
    @grades[grade]
  end

  def to_h
    grades = {}
    @grades.keys.sort.each { |grade| grades[grade] = @grades[grade] }
    grades
  end
end
