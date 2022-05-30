# frozen_string_literal: true

class Wagon
  attr_reader :type, :number

  def initialize(number)
    @number = number
    @type = nil
  end
end
