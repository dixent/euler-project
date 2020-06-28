class Problem7
  RESULT_POSITION = 10001

  def initialize
    @position = 1
    @number = 2
  end

  def resolve
    loop do
      @number += 1
      @position += 1 if prime_number?(number)
      return number if RESULT_POSITION == position
    end
  end

  private

  attr_reader :position, :number

  def prime_number?(number)
    prime_dividers = [1, number]
    (2..number).each_with_object([1]) do |divider, dividers|
      if number % divider == 0
        dividers << divider

        return false unless dividers == prime_dividers
      else
        divider += 1
      end
    end
  end
end

puts Problem7.new.resolve
