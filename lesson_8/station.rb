# frozen_string_literal: true

require_relative './mod/instance_counter'
require_relative './mod/validate'

class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name

  NAME_SAMPLE = /^([a-z]|\d){3,}$/i.freeze

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instance
  end

  def train_add(train)
    @trains << train
  end

  def train_remove(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def each_train(&block)
    @trains.each(&block) if block_given?
  end

  private

  def validate!
    raise 'Недопустимое название станции' if name !~ NAME_SAMPLE
  end
end
