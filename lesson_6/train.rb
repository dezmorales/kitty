# frozen_string_literal: true

require_relative './mod/company'
require_relative './mod/instance_counter'
require_relative './mod/validate'

class Train
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_reader :speed, :number, :wagons, :current_station

  NUMBER_SAMPLE = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze

  @@trains = []

  def initialize(number)
    @speed = 0
    @number = number
    @wagons = []
    validate!
    @@trains.push(self)
    register_instance
  end

  class << self
    def all
      @@trains
    end

    def find(number)
      @@trains.find { |train| train.number == number }
    end
  end

  def add_speed(speed)
    @speed = speed
  end

  def stop_train
    @speed = 0
  end

  def add_wagon(wagon)
    raise 'Тип вагона и поезда не совпадает' unless wagon.type == @type

    @wagons << wagon if @speed.zero?
  end

  def remove_wagon(wagon)
    @wagons.delete(wagon) if @speed.zero?
  end

  def add_route(route)
    @route = route
    route.first_station.train_add(self)
    @current_station = route.first_station
  end

  def move_forward
    raise 'Поезд на конечной станциии, движение вперед невозможно' if @current_station == @route.last_station

    @speed = 60
    @current_station.train_remove(self)
    next_station.train_add(self)
    @current_station = next_station
    stop_train
  end

  def move_back
    raise 'Поезд на первой станциии, движение назад невозможно' if @current_station == @route.first_station

    @speed = 60
    @current_station.train_remove(self)
    previous_station.train_add(self)
    @current_station = previous_station
    stop_train
  end

  protected

  def validate!
    raise 'Недопустимый номер поезда' if number !~ NUMBER_SAMPLE
  end

  def next_station
    return if @current_station == @route.last_station

    station_index = @route.stations.index(@current_station)
    @route.stations[station_index + 1]
  end

  def previous_station
    return if @current_station == @route.first_station

    station_index = @route.stations.index(@current_station)
    @route.stations[station_index - 1]
  end
end
