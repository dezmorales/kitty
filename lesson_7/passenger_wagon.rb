# frozen_string_literal: true

require_relative './mod/wagon_capacity'

class PassengerWagon < Wagon
  include WagonCapacity

  attr_accessor :busy

  def initialize(number, capacity)
    @capacity = capacity
    @busy = 0
    super
    @type = 'passenger'
  end
end
