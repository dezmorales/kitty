# frozen_string_literal: true

class PassengerWagon < Wagon
  def initialize(number)
    super
    @type = 'passenger'
  end
end
