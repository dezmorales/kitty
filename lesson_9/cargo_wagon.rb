# frozen_string_literal: true

class CargoWagon < Wagon
  attr_accessor :busy

  def initialize(number, capacity)
    super
    @type = 'cargo'
  end

  def take_volume(amount)
    raise 'Не хватает места' if amount > free_place

    @busy += amount
  end
end
