require 'pry'

class Car
  attr_accessor :brand, :model

  def initialize(new_car)
    @brand = new_car.split(' ').first
    @model = new_car.split(' ').last
    binding.pry
  end

end

betty = Car.new('Ford Mustang')
p betty.model.start_with?('F')
p betty.brand.start_with?('F')