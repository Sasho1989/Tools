RSpec.describe Tools::Luhn do

  it "doesn't allow single digit strings" do
    luhn_example = Tools::Luhn.new('3')
    expect(luhn_example.valid?).to be false
  end

  it "doesn't allow empty strings" do
    luhn_example = Tools::Luhn.new('')
    expect(luhn_example.valid?).to be false
  end

  it "doesn't allow single zero input" do
    luhn_example = Tools::Luhn.new('0')
    expect(luhn_example.valid?).to be false
  end

  it "remains valid if digits reversed" do
    luhn_example = Tools::Luhn.new('059')
    expect(luhn_example.valid?).to be true
  end

  it "becomes invalid if digits reversed" do
    luhn_example = Tools::Luhn.new('59')
    expect(luhn_example.valid?).to be true
  end

  it "is valid canadian sin num" do
    luhn_example = Tools::Luhn.new('055 444 285')
    expect(luhn_example.valid?).to be true
  end

  it "is invalid canadian sin num" do
    luhn_example = Tools::Luhn.new('055 444 286')
    expect(luhn_example.valid?).to be false
  end

  it "is invalid credit card" do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn_example.valid?).to be false
  end

  it "is valid str with a non digit added at the end that becomes invalid" do
    luhn_example = Tools::Luhn.new('059a')
    expect(luhn_example.valid?).to be false
  end

  it "is valid str with punctuation included become invalid" do
    luhn_example = Tools::Luhn.new('055-444-285')
    expect(luhn_example.valid?).to be false
  end

  it "is valid str with symbols included becomes invalid" do
    luhn_example = Tools::Luhn.new('055£ 444$ 285')
    expect(luhn_example.valid?).to be false
  end

  it "is invalid with space and a single zero" do
    luhn_example = Tools::Luhn.new(' 0')
    expect(luhn_example.valid?).to be false
  end

  it 'is valid with more than a single zero' do
    luhn_example = Tools::Luhn.new('0000 0')
    expect(luhn_example.valid?).to be true
  end

  it 'is converted correctly from input digit 9 to output' do
    luhn_example = Tools::Luhn.new('091')
    expect(luhn_example.valid?).to be true
  end

  it 'is invalid with non digits included' do
    luhn_example = Tools::Luhn.new(':9')
    expect(luhn_example.valid?).to be false
  end
end
