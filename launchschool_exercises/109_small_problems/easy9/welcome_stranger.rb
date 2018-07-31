def greetings(name, info)
  "Hello #{name[0]} #{name[1]} #{name[2]}! Nice to have a #{info[:title]} #{info[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.
