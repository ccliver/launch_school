require 'securerandom'

def uuid()
  sections = [4, 2, 2, 2, 6]
  uuid = []
  sections.each do |section|
    uuid << SecureRandom.hex(section)
  end
  uuid.join('-')
end

puts uuid
