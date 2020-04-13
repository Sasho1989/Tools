require "tools/version"

module Tools
  class Odd_number
    def initialize(arr)
      @arr = arr
    end

    def first_odd_num
      all_odd_num.first
    end

    def all_odd_num
      group_num.select { |_k, v| v.size.odd? }.keys
    end

    def group_num
      @arr.group_by { |elem| elem }
    end
  end

  class Antipodes
    def initialize(antipodes)
      @antipodes = antipodes
    end

    def sum_of_averages
      output
    end

    private

    def left_array
      indexes.map { |i| @antipodes[i] }
    end

    def right_array
      indexes.map { |i| reversed_array[i] }
    end

    def reversed_array
      @antipodes.reverse
    end

    def sum
      [left_array, right_array].transpose.map { |l, r| l + r }
    end

    def output
      sum.map { |i| i / 2.0 }
    end

    def indexes
      arr = @antipodes.length / 2
      @antipodes[0...arr]
    end
  end

  class Resistor
    RESISTOR_VALUES = {
      black: {
        color: 0,
        multiplier: 1,
        tolerance:20
      },
      brown: {
        color: 1,
        multiplier: 10,
        tolerance: 1
      },
      red: {
        color: 2,
        multiplier: 100,
        tolerance: 2
      },
      orange: {
        color: 3,
        multiplier: 1_000,
        tolerance: 0.2
      },
      yellow: {
        color: 4,
        multiplier: 10_000,
        tolerance: 0.05
      },
      green: {
        color: 5,
        multiplier: 100_000,
        tolerance: 0.5
      },
      blue: {
        color: 6,
        multiplier: 1_000_000,
        tolerance: 0.25
      },
      violet: {
        color: 7,
        multiplier: 10_000_000,
        tolerance: 0.10
      },
      gray: {
        color: 8,
        multiplier: 100_000_000,
        tolerance: 0.05
      },
      white: {
        color: 9,
        multiplier: 1_000_000_000,
        tolerance: 10
      },
      gold: {
        multiplier: 0.10,
        tolerance: 5
      },
      silver: {
        multiplier: 0.10,
        tolerance: 10
      }
    }

    attr_reader :resistor_band1, :resistor_band2

    def initialize(resistor_bands)
      @resistor_band1, @resistor_band2, @multiplier, @tolerance = resistor_bands
    end

    #def color_duo
     # [0..1].map { |resistor_bands| RESISTOR_VALUES[resistor_bands] }.join.to_i
    #end

    def specifications
      "#{match_bands * multiplier} ohms +-#{tolerance}%"
    end

    private

    def multiplier
      RESISTOR_VALUES[@multiplier.to_sym][:multiplier]
    end

    def tolerance
      @tolerance.nil? ? 20 : RESISTOR_VALUES[@tolerance.to_sym][:tolerance]
    end

    def match_bands
      color(resistor_band1) * 10 + color(resistor_band2)
    end

    def color(color_key)
      RESISTOR_VALUES[color_key.to_sym][:color]
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
