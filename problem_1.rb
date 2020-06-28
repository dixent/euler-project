puts (0...1000).inject { |sum, number| number % 3 == 0 || number % 5 == 0 ? sum + number : sum }
