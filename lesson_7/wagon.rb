# frozen_string_literal: true

require_relative './mod/company'
require_relative './mod/validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type, :number

  NUMBER_SAMPLE = /^([a-z]|\d){3}$/i.freeze

  def initialize(number, capacity)
    @capacity = capacity
    @busy = 0
    @number = number
    @type = nil
    validate!
  end

  def free_place
    @capacity - @busy
  end

  protected

  def validate!
    raise 'Недопустимый номер вагона' if number !~ NUMBER_SAMPLE
  end
end
