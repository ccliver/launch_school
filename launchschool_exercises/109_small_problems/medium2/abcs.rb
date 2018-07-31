def block_word?(word)
  seen = true
  unseen = false
  valid = true
  char_map = [
    { 'B' => unseen, 'O' => unseen },
    { 'X' => unseen, 'K' => unseen },
    { 'D' => unseen, 'Q' => unseen },
    { 'C' => unseen, 'P' => unseen },
    { 'N' => unseen, 'A' => unseen },
    { 'G' => unseen, 'T' => unseen },
    { 'R' => unseen, 'E' => unseen },
    { 'F' => unseen, 'S' => unseen },
    { 'J' => unseen, 'W' => unseen },
    { 'H' => unseen, 'U' => unseen },
    { 'V' => unseen, 'I' => unseen },
    { 'L' => unseen, 'Y' => unseen },
    { 'Z' => unseen, 'M' => unseen }
  ]
  word.chars do |ch|
    char_map.each_with_index do |map, idx|
      char_map[idx][ch.upcase] = seen if map.has_key?(ch.upcase)
    end
  end
  
  char_map.each do |map|
    valid = false if map.values == [seen, seen]
  end
  valid
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
