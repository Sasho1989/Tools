RSpec.describe Tools::Resistor do

  it 'matches a color duo values with resistance value' do
    resistor = Tools::Resistor.new('brown', 'green', '')
    expect(resistor.color_duo).to eq(15)
  end

  it 'still returns the color duo when given 3 colors' do
    resistor = Tools::Resistor.new('red', 'orange', 'yellow')
    expect(resistor.color_duo).to eq(23)
  end
end
