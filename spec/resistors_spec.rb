RSpec.describe Tools::Resistor do

# it 'matches a color duo values with resistance value' do
  # resistor = Tools::Resistor.new(['brown', 'green', ''])
  # expect(resistor.color_duo).to eq(15)
# end

# it 'still returns the color duo when given 3 colors' do
  # resistor = Tools::Resistor.new(['red', 'orange', 'yellow'])
  # expect(resistor.color_duo).to eq(23)
# end

  describe 'Full resistor specifications' do
    it 'presents the specifications' do
      resistor = Tools::Resistor.new(['blue', 'yellow', 'red'])
      expected = "6400 ohms +-20%"

      expect(resistor.specifications).to eq expected
    end

    it 'presents the specifications' do
      resistor = Tools::Resistor.new(['blue', 'yellow', 'red', 'gold'])
      expected = "6400 ohms +-5%"

      expect(resistor.specifications).to eq expected
    end
  end
end

