# frozen_string_literal: true

require_relative './mod/instance_counter'
require_relative './mod/validate'

class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name

  NAME_SAMPLE = /^([a-z]|\d){3,}$/i.freeze

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations.push(self)
    register_instance
  end

  def self.all
    @@stations
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

  private

  def validate!
    raise 'Недопустимое название станции' if name !~ NAME_SAMPLE
  end
end
