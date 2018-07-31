class WheeledVehicle
  attr_accessor :wheels, :make, :model
  
  def initialize(wheels, make, model)
    self.wheels = wheels
    self.make = make
    self.model = model
  end
end

class Car < WheeledVehicle
  def initialize(make, model)
    super(4, make, model)
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle < WheeledVehicle
  def initialize(make, model)
    super(2, make, model)
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck < WheeledVehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(6, make, model)
    @payload = payload
  end

  def to_s
    "#{make} #{model}"
  end
end

puts Car.new('Honda', 'Element')
puts Motorcycle.new('Harley', 'Sportster')
puts Truck.new('Toyota', 'Tacoma', 'wood')
puts Car.new('Honda', 'Element').wheels
puts Motorcycle.new('Harley', 'Sportster').wheels
puts Truck.new('Toyota', 'Tacoma', 'wood').wheels
