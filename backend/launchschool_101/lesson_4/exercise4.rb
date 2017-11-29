ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum_age = ages['Herman']
ages.each do |k, v|
  if v < minimum_age
    minimum_age = v
  end
end
puts ages.inspect
puts minimum_age
