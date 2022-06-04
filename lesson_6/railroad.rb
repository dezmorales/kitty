# frozen_string_literal: true

class Rail
  attr_accessor :rail_stations, :rail_routes, :rail_trains, :rail_wagons

  def initialize
    @rail_stations = []
    @rail_routes = []
    @rail_trains = []
    @rail_wagons = []
  end

  def create_station
    puts 'Введите название станции:'
    station_name = gets.chomp.to_s

    if find_station(station_name)
      puts 'Станция с таким именем существует'
      return
    end

    @rail_stations << Station.new(station_name)
    puts "Cтанция #{station_name} создана"
  end

  def create_cargo_train
    puts 'Введите номер поезда:'
    train_number = gets.chomp.to_s

    if find_train(train_number)
      puts 'Поезд с таким номером уже создан'
      return
    end

    @rail_trains << CargoTrain.new(train_number)
    puts "Грузовой поезд номер #{train_number} создан"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_passenger_train
    puts 'Введите номер поезда:'
    train_number = gets.chomp.to_s

    if find_train(train_number)
      puts 'Поезд с таким номером уже создан'
      return
    end

    @rail_trains << PassengerTrain.new(train_number)
    puts "Пассажирский поезд номер #{train_number} создан"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_cargo_wagon
    puts 'Введите номер вагона:'
    wagon_number = gets.chomp.to_s

    if find_wagon(wagon_number)
      puts 'Вагон с таким номером уже создан'
      return
    end

    @rail_wagons << CargoWagon.new(wagon_number)
    puts "Грузовой вагон номер #{wagon_number} создан"
  end

  def create_passenger_wagon
    puts 'Введите номер вагона:'
    wagon_number = gets.chomp.to_s

    if find_wagon(wagon_number)
      puts 'Вагон с таким номером уже создан'
      return
    end

    @rail_wagons << PassengerWagon.new(wagon_number)
    puts "Пассажирский вагон номер #{wagon_number} создан"
  end

  def create_route
    puts 'Введите название первой станции:'
    first_station_name = gets.chomp.to_s
    first_station = find_station(first_station_name)

    puts 'Введите название последней станции:'
    last_station_name = gets.chomp.to_s
    last_station = find_station(last_station_name)

    if first_station.nil? || last_station.nil?
      puts 'Станция введена неверно'
      return
    end

    puts 'Введите номер маршрута:'
    number = gets.chomp.to_s

    if find_route(number)
      puts 'Маршрут с таким номером уже создан'
      return
    end

    @rail_routes << Route.new(first_station, last_station, number)
    puts "Маршрут #{number} создан"
  end

  def add_station_to_route
    puts 'Введите название станции:'
    station_name = gets.chomp.to_s
    station = find_station(station_name)

    puts 'Введите номер маршрута:'
    route_number = gets.chomp.to_s
    route = find_route(route_number)

    if station.nil? || route.nil?
      puts 'Данные введены неверно'
      return
    end

    route.add_station(station)
    puts "Станция #{station_name} добалена в маршрут"
  end

  def remove_station_from_route
    puts 'Введите название станции:'
    station_name = gets.chomp.to_s
    station = find_station(station_name)

    puts 'Введите номер маршрута:'
    route_number = gets.chomp.to_s
    route = find_route(route_number)

    if station.nil? || route.nil?
      puts 'Данные введены неверно'
      return
    end

    route.delete_station(station)
    puts "Станция #{station_name} удалена из маршрута"
  end

  def add_route_to_train
    puts 'Введите номер поезда'
    train_number = gets.chomp.to_s
    train = find_train(train_number)

    puts 'Введите номер маршрута'
    route_number = gets.chomp.to_s
    route = find_route(route_number)

    if train.nil? || route.nil?
      puts 'Данные введены неверно'
      return
    end

    train.add_route(route)
    puts "Маршрут #{route_number} добавлен поезду #{train_number}"
  end

  def add_wagon_to_train
    puts 'Введите номер поезда'
    train_number = gets.chomp.to_s
    train = find_train(train_number)

    puts 'Введите номер вагона'
    wagon_number = gets.chomp.to_s
    wagon = find_wagon(wagon_number)

    if train.nil? || wagon.nil?
      puts 'Данные введены неверно'
      return
    end

    puts "Вагон #{wagon_number} добавлен к поезду" if train.add_wagon(wagon)
  end

  def remove_wagon_from_train
    puts 'Введите номер поезда'
    train_number = gets.chomp.to_s
    train = find_train(train_number)

    puts 'Введите номер вагона'
    wagon_number = gets.chomp.to_s
    wagon = find_wagon(wagon_number)

    if train.nil? || wagon.nil?
      puts 'Данные введены неверно'
      return
    end

    train.remove_wagon(wagon)
    puts "Вагон #{wagon_number} отцеплен от поезда"
  end

  def train_move_forward
    puts 'Введите номер поезда'
    train_number = gets.chomp.to_s
    train = find_train(train_number)

    if train.nil?
      puts 'Данные введены неверно'
      return
    end

    train.move_forward
    puts "Поезд #{train_number} двигается вперед"
  end

  def train_move_back
    puts 'Введите номер поезда'
    train_number = gets.chomp.to_s
    train = find_train(train_number)

    if train.nil?
      puts 'Данные введены неверно'
      return
    end

    train.move_back
    puts "Поезд #{train_number} двигается назад"
  end

  def show_stations
    @rail_stations.each do |station|
      print "Станция - #{station.name} "
      station.trains.each { |train| print "Поезд - #{train.number} " }
      puts
    end
  end

  def menu
    puts 'Введите пункт для проведения операции'
    puts '1.Создать станцию'
    puts '2.Создать грузовой поезд'
    puts '3.Создать пассажирский поезд'
    puts '4.Создать грузовой вагон'
    puts '5.Создать пассажирский вагон'
    puts '6. Создать маршрут'
    puts '7. Добавить станцию в маршрут'
    puts '8. Удалить станцию из маршрута'
    puts '9. Назначить маршрут поезду'
    puts '10. Добавить вагон к поезду'
    puts '11. Отцепить вагон от поезда'
    puts '12. Переместить поезд по маршруту вперед'
    puts '13. Переместить поезд по маршруту назад'
    puts '14. Просмотреть список станций и поездов находящихся на них'
    puts '15. Выход'
  end

  private

  def find_station(name)
    @rail_stations.find { |station| station.name == name }
  end

  def find_route(number)
    @rail_routes.find { |route| route.number == number }
  end

  def find_train(number)
    @rail_trains.find { |train| train.number == number }
  end

  def find_wagon(number)
    @rail_wagons.find { |wagon| wagon.number == number }
  end
end
