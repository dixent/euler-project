sum_squares = 0
sum = 0
(1..100).each do |number|
  sum += number
  sum_squares += number ** 2
end
puts (sum ** 2) - sum_squares
