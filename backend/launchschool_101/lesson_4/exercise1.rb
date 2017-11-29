flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_index do |index|
  flintstones_hash[flintstones[index]] = index
end
puts flintstones_hash.inspect
