## NOTE: This is not the proper algorithm for picking which lights get turned off.

lights = []
1000.times { lights << 'on' }

start_idx = 0
1000.times do
  lights[start_idx..-1].each_with_index do |_, idx|
    if lights[idx] == 'on'
      lights[idx] = 'off'
    else
      lights[idx] = 'on'
    end
  end
  start_idx += 1
end

ons = lights.select { |light| light == 'on' }
offs = lights.select { |light| light == 'off' }

puts "There are #{ons.length} lights on and #{offs.length} lights off."
