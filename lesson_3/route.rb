class Route
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations .insert(-2, station)
  end

  def delete_station(station)
    if  @stations[0] == station ||  @stations[-1] == station
      puts "Эту станцию нельзя удалить"
    else
      station_index =  @stations.index(station)
      @stations.delete_at(station_index) unless station_index.nil?
    end
  end

  def stations
    @stations.each { |station| puts station }
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end
end