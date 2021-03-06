# Towable (Part 1)

# Using the following code, create a module named Towable that contains a method named tow. The module should be included in Truck and tow should print I can tow a trailer! when invoked.

# Expected output:
# I can tow a trailer!

module Towable
  def tow
    "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
puts truck1.tow