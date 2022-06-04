# frozen_string_literal: true

require_relative './mod/instance_counter'
require_relative './mod/validate'

class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push(self)
    validate!
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
    raise 'Название станции не может быть пустым' if name.nil? || name.length.zero?
    raise 'Недопустимое название станции' if @name.length < 3
  end
end
