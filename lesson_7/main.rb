# frozen_string_literal: true

require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'railroad'

railroad = Rail.new
railroad.menu

loop do
  input = gets.chomp.to_i
  case input
  when 1
    railroad.create_station
  when 2
    railroad.create_cargo_train
  when 3
    railroad.create_passenger_train
  when 4
    railroad.create_cargo_wagon
  when 5
    railroad.create_passenger_wagon
  when 6
    railroad.create_route
  when 7
    railroad.add_station_to_route
  when 8
    railroad.remove_station_from_route
  when 9
    railroad.add_route_to_train
  when 10
    railroad.add_wagon_to_train
  when 11
    railroad.remove_wagon_from_train
  when 12
    railroad.train_move_forward
  when 13
    railroad.train_move_back
  when 14
    railroad.show_stations
  when 15
    railroad.places_or_volume
  when 16
    railroad.train_wagon_list
  when 17
    railroad.station_train_list
  when 18
    break
  end
end
