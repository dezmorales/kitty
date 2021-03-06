# frozen_string_literal: true

require_relative './mod/company'
require_relative './mod/validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type, :number

  NUMBER_SAMPLE = /^([a-z]|\d){3}$/i.freeze

  def initialize(number)
    @number = number
    @type = nil
    validate!
  end

  protected

  def validate!
    raise 'Недопустимый номер вагона' if number !~ NUMBER_SAMPLE
  end
end
