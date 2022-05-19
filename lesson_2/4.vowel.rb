vowels = ["a", "o", "e", "u", "i", "y"]
hash = {}
('a'..'z').each_with_index {|l, i| hash[l] = i + 1 if vowels.include?(l)}
puts hash



