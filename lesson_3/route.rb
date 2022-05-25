class Route
  def initialize(first_station, last_station)
    @all_station = [first_station, last_station]
  end

  def add_station(station)
    @all_station.insert(-2, station)
  end

  def delete_station(station)
    if @all_station[0] == station || @all_station[-1] == station
      puts "Эту станцию нельзя удалить"
    else
      station_index = @all_station.index(station)
      @all_station.delete_at(station_index)
    end
  end

  def stations
    @all_station.each { |station| puts station }
  end

  def first_station
    @all_station.first
  end

  def last_station
    @all_station.last
  end
end