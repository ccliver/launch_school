class Pet
  attr_accessor :type, :name

  def initialize(type, name)
    self.type = type
    self.name = name
  end
end

class Owner
  attr_accessor :name, :pets

  def initialize(name)
    self.name = name
    self.pets = []
  end
  
  def adopt(pet)
    self.pets << pet
  end

  def number_of_pets
    pets.length
  end
end

class Shelter
  attr_accessor :adoptions
  
  def initialize
    self.adoptions = []
  end
  
  def adopt(owner, pet)
    self.adoptions << [owner.name, pet.name]
    owner.adopt(pet)
  end

  def print_adoptions
    puts "Adoptions:"
    self.adoptions.each { |adoption| puts "#{adoption[0]} adopted #{adoption[1]}" }
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
