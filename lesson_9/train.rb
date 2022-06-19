# frozen_string_literal: true

require_relative './mod/company'
require_relative './mod/instance_counter'
require_relative './mod/validate'

class Train
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_reader :speed, :number, :wagons, :current_station, :type

  attr_accessor_with_history :var1, :var2
  strong_attr_accessor :var3, String

  validate :number, :presence
  validate :number, :format, NUMBER_SAMPLE

  NUMBER_SAMPLE = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze

  def initialize(number)
    @speed = 0
    @number = number
    @wagons = []
    validate!
    register_instance
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

  def each_wagon(&block)
    @wagons.each(&block) if block_given?
  end

  protected

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
