RSpec.describe Tools::Antipodes do
  it 'returns the sum of average for split array with even lenghts' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4])
    expected = [2.5, 2.5]

    expect(antipodes.sum_of_averages).to eq expected
  end

  it 'returns the sum for split arr without even lenhgts' do
    antipodes = Tools::Antipodes.new([1, 2, 3, 4, 5])
    expected = [3, 3]

    expect(antipodes.sum_of_averages).to eq expected
  end

  it 'returns the antipodes average if given negative numbers' do
    antipodes = Tools::Antipodes.new([-1, -2])
    expected = [-1.5]

    expect(antipodes.sum_of_averages).to eq expected
  end
end
