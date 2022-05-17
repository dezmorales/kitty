puts 'Введите ваше имя:'
name = gets.chomp
puts 'Введите ваш рост:'
height = gets.chomp.to_i
ideal = (height - 110) * 1.15

if ideal < 0
  puts 'Ваш вес уже оптимальный'
else
  puts "#{name}, Ваш идеальный вес #{ideal} кг"
end
