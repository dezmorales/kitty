puts 'Введите число:'
day = gets.to_i
puts 'Введите месяц:'
month = gets.to_i
puts 'Введите год:'
year = gets.to_i

if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  month_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
else
  month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
end
number = month_days.first(month - 1).sum(day)
puts "Порядковый номер даты: #{number}"