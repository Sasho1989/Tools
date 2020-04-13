RSpec.describe Tools::Odd_number do
  it 'returns the first int that appears an odd number of times' do
    arr = Tools::Odd_number.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expected = 5

    expect(arr.first_odd_num).to eq expected
  end

  it 'returns all odd int in a given array' do
    arr = Tools::Odd_number.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expected = [5, -1]

    expect(arr.all_odd_num).to eq expected
  end

  it 'returns the first int even if array has one element' do
    arr = Tools::Odd_number.new([10])
    expected = 10

    expect(arr.first_odd_num).to eq expected
  end

  it 'returns all int if given array has one element' do
    arr = Tools::Odd_number.new([10])
    expected = [10]

    expect(arr.all_odd_num).to eq expected
  end
end
