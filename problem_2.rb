MAXIMUM_NUMBER = 4000000

last = 2
pre_last = 1
sum = 2

loop do
  number = last + pre_last

  break if number >= MAXIMUM_NUMBER

  sum += number if number.even?

  pre_last = last
  last = number
end

puts sum
