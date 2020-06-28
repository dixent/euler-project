class Problem3
  def initialize(number)
    @number = number
    @last_prime_number = nil
    @divider = 2
    @prime_check = true
  end

  def resolve
    loop do
      if number % divider == 0
        @number /= divider
        update_prime_number
        return last_prime_number if divider >= number
      elsif prime_number?(number)
        return number
      else
        @divider += 1
        @prime_check = nil
      end
    end
    last_prime_number
  end

  private

  attr_reader :number, :last_prime_number, :divider, :prime_check

  def update_prime_number
    return unless prime_check.nil?

    @last_prime_number = divider if prime_number?(divider)
  end

  def prime_number?(number)
    prime_dividers = [1, number]
    @prime_check = (2..number).each_with_object([1]) do |divider, dividers|
      if number % divider == 0
        dividers << divider

        return false unless dividers == prime_dividers
      else
        divider += 1
      end
    end
  end
end

puts Problem3.new(600851475143).resolve
