def transpose(matrix)
  new_array = [[], [], []]
  matrix.each do |row|
    new_array[0] << row[0]
    new_array[1] << row[1]
    new_array[2] << row[2]
  end
  new_array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p new_matrix
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
