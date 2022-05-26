class Train
  attr_reader :speed, :wagons, :type, :current_station


  TYPE_TRAIN = %w[cargo passenger].freeze

  def initialize(number, type, wagons)
    @speed = 0
    @number = number
    @type = type
    @wagons = wagons

    raise "Неверный тип поезда" unless TYPE_TRAIN.include?(@type)
    raise "Неверное количество вагонов" unless wagons.is_a?(Integer)
  end

  def add_speed(speed)
      @speed = speed
  end

  def brake
    @speed = 0
  end

  def add_wagons
    @wagons += 1 if @speed.zero?
  end

  def remove_wagons
    @wagons -= 1 if @speed.zero?
  end

  def add_route(route)
    @route = route
    route.first_station.train_add(self)
    @current_station = route.first_station
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

  def move_forward
    return if @current_station == @route.last_station

    @speed = 60
    @current_station.train_remove(self)
    next_station.train_add(self)
    @current_station = next_station
    brake
  end

  def move_back
    return if @current_station == @route.first_station

    @speed = 60
    @current_station.train_remove(self)
    previous_station.train_add(self)
    @current_station = previous_station
    brake
  end
end