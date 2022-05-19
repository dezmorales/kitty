puts 'Для окончания ввода продуктов введите "стоп"'
products = {}
count = 0

loop do
  puts 'Название товара:'
  product = gets.chomp.to_s
  break if product == "стоп"

  puts 'Цена товара:'
  price = gets.to_i

  puts 'Количество товара:'
  amount = gets.to_f

  products[product] = {price: price, amount: amount}
end

puts products
products.each do |p, a|
  total = a[:price] * a[:amount]
  puts "Цена за #{p}: #{total}"
  count += total
end

puts "Итоговая сумма: #{count}"
