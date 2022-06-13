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
    raise 'Не хватает места' if self.free_place < 1
    @busy += 1
  end

  def free_place
    @capacity - @busy
  end
end
