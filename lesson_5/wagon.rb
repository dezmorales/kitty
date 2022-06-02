# frozen_string_literal: true

require_relative './mod/company'

class Wagon
  include Manufacturer

  attr_reader :type, :number

  def initialize(number)
    @number = number
    @type = nil
  end
end
