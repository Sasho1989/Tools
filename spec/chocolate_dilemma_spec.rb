RSpec.describe Tools::Chocolate_dilemma do
  it 'returns true if total area of chocolate is the same' do
    chocolate = Tools::Chocolate_dilemma.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(chocolate.fairness?).to be true
  end

  it 'returns false if total area is different' do
    chocolate = Tools::Chocolate_dilemma.new([[5, 3], [8, 2], [1, 2]], [[2, 3], [1, 4], [6, 2]])
    expect(chocolate.fairness?).to be false
  end
end
