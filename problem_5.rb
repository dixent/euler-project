class Problem5
  BUNCH = (2..20).freeze

  def initialize
    @dividers = {}
  end

  def resolve
    BUNCH.each do |number|
      number_dividers = get_dividers_from_number(number)
      add_dividers_if_needed(number_dividers)
    end
    calculate_result_number
  end

  private

  attr_reader :dividers

  def get_dividers_from_number(number)
    divider = 2
    dividers = {}
    while divider <= number
      if number % divider == 0
        number /= divider
        dividers[divider] = (dividers[divider] || 0) + 1
      else
        divider += 1
      end
    end
    dividers
  end

  def add_dividers_if_needed(number_dividers)
    number_dividers.each_pair do |divider, count|
      @dividers[divider] ||= count
      @dividers[divider] = count if dividers[divider] < count
    end
  end

  def calculate_result_number
    result = 1
    dividers.each_pair do |divider, count|
      result *= divider ** count
    end
    result
  end
end

puts Problem5.new.resolve
