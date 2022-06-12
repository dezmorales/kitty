# frozen_string_literal: true

require_relative './mod/instance_counter'
require_relative './mod/validate'

class Route
  include InstanceCounter
  include Validate

  attr_reader :number, :stations

  NUMBER_SAMPLE = /^([a-z]|\d){3}$/i.freeze

  @@routes = []

  def initialize(first_station, last_station, number)
    @number = number
    @stations = [first_station, last_station]
    validate!
    @@routes.push(self)
    register_instance
  end

  def self.all
    @@routes
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if @stations[0] == station || @stations[-1] == station
      raise 'Эту станцию нельзя удалить'
    else
      station_index = @stations.index(station)
      @stations.delete_at(station_index) unless station_index.nil?
    end
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end

  private

  def validate!
    raise 'Не задана первая или последняя станция' unless first_station.is_a?(Station) || last_station.is_a?(Station)
    raise 'Недопустимый номер маршрута' if number !~ NUMBER_SAMPLE
  end
end
