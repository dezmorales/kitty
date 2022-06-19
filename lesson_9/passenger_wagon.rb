# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_accessor :busy

  def initialize(number, capacity)
    @capacity = capacity
    @busy = 0
    super
    @type = 'passenger'
  end

  def take_place
    raise 'Не хватает места' if free_place < 1

    @busy += 1
  end
end
