require 'pry'

class Problem4
  MAX_NUMBER = 999

  def initialize
    @numbers_order_by_desc = (1..MAX_NUMBER).to_a.reverse
    @max_current_palindrom = 0
  end

  def resolve
    numbers_order_by_desc.each do |i|
      numbers_order_by_desc.each do |j|
        numbers_order_by_desc.each do |m|
          multiplication_result = i * j * m
          next if multiplication_result <= max_current_palindrom
          next unless palindrom?(multiplication_result.to_s)

          return max_palindrom if max_palindrom == multiplication_result

          @max_current_palindrom = multiplication_result
        end
      end
    end
    max_palindrom
  end

  private

  attr_reader :numbers_order_by_desc, :max_current_palindrom

  def max_palindrom
    @max_palindrom ||= begin
      max_multiplication_result_string = (MAX_NUMBER ** 3).to_s
      palindrom_size = if max_multiplication_result_string.size.even?
                         max_multiplication_result_string.size
                       else
                         max_multiplication_result_string.size - 1
                       end
      ('9' * palindrom_size).to_i
    end
  end

  def palindrom?(string_number)
    string_number.size.even? && left_compare_right?(string_number)
  end

  def left_compare_right?(string_number)
    length = string_number.length
    string_number[0...(length / 2)] == string_number[(length / 2)...length].reverse
  end
end

puts Problem4.new.resolve
