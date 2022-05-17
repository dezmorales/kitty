puts 'Введите первую сторону треугольника:'
a = gets.to_i
puts 'Введите вторую сторону треугольника:'
b = gets.to_i
puts 'Введите третью сторону треугольника:'
c = gets.to_i
sorted = [a, b, c].sort

if sorted[2] ** 2 == sorted[0] ** 2 + sorted[1] ** 2
  puts 'Треугольник прямоугольный'
elsif sorted[0] - sorted[1] == 0 && sorted[1] != sorted[2]
  puts 'Треугольник равнобедренный'
elsif sorted[0] == sorted[1] && sorted[1] == sorted[2]
  puts 'Треугольник равносторонний'
else
  puts 'Треугольник не является прямоугольным, равнобедренным, равносторонним'
end
