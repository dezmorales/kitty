puts 'Введите первый коэффициент'
a = gets.to_i
puts 'Введите второй коэффициент'
b = gets.to_i
puts 'Введите третий коэффициент'
c = gets.to_i
d = (b ** 2 - 4 * a * c)

if d < 0
  puts "Дискриминант:#{d}. Корней нет"
elsif d == 0
  x1 = (- b + Math.sqrt(d)) / (2 * a)
  puts "#Дискриминант:#{d}, корни:#{x1}"
else
  x1 = (- b + Math.sqrt(d)) / (2 * a)
  x2 = (- b - Math.sqrt(d)) / (2 * a)
  puts "Дискриминант:#{d}, корни:#{x1}, #{x2}"
end
