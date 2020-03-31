require "tools/version"

module Tools

  class Resistor

    COLORS_TO_RESISTANCE = {
      'black' => 0,
      'brown' => 1,
      'red' => 2,
      'orange' => 3,
      'yellow' => 4,
      'green' => 5,
      'blue' => 6,
      'violet' => 7,
      'grey' => 8,
      'white' => 9
    }.freeze

    def initialize(color1, color2, color3)
      @colors_arr = [color1, color2, color3]
    end

    def color_duo
      @colors_arr[0..1].map { |color| COLORS_TO_RESISTANCE[color] }.join.to_i
    end
  end

  class Allergies
    LIMIT = 256
    ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }

    def initialize(score)
      @score = score
      @score -= LIMIT while @score >= LIMIT
    end

    def allergic_to?(allergen)
      score_allergens.include?(allergen)
    end

    def score_allergens
      allergen_keys.map { |key| ALLERGENS[key] }
    end

    private

    def keys
      ALLERGENS.keys.select { |keys| keys <= @score }.sort.reverse!
    end

    def allergen_keys
      tmp = @score
      keys.select { |elem| tmp >= elem && tmp -= elem }
    end
  end


  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if @str.delete(' ').length <= 1

      stripped = @str.delete(' ')
      puts "stripped: #{stripped}"

      reversed_strip = stripped.reverse
      puts "reversed_strip: #{reversed_strip}"

      reversed_array = reversed_strip.chars
      puts "reversed_array: #{reversed_array}"

      every_first_range = (0..reversed_array.length - 1).step(2)
      every_first_array = every_first_range.map { |i| reversed_array[i].to_i }
      puts "every_first_array: #{every_first_array}"

      every_second_range = (1..reversed_array.length - 1).step(2)
      every_second_array = every_second_range.map { |i| reversed_array[i].to_i }
      puts "every_second_array: #{every_second_array}"

      doubled = every_second_array.map { |i| ((i * 2) - 9 if i >= 5) || i * 2 }
      puts "doubled: #{doubled}"

      sum = doubled.sum.to_i + every_first_array.sum.to_i
      puts "sum: #{sum}"

      if (sum % 10).zero?
        true
      else
        false
      end
    end
  end
end
