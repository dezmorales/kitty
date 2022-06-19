# frozen_string_literal: true

require_relative './mod/company'
require_relative './mod/validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type, :number

  validate :number, :presence
  validate :number, :type, String

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
end
