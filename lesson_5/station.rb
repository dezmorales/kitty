# frozen_string_literal: true

require_relative './mod/instance_counter'

class Station
  include InstanceCounter

  attr_reader :trains, :name

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
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
end
