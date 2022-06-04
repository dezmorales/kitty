# frozen_string_literal: true

require_relative './mod/company'
require_relative './mod/validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type, :number

  def initialize(number)
    @number = number
    @type = nil
    validate!
  end

  protected

  def validate!
    raise 'Номер вагона не может быть пустым' if @number.nil? || @number.length.zero?
    raise 'Недопустимый номер вагона' if @number.length < 3
  end
end
