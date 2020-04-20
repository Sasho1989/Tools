RSpec.describe Tools::Pokemon do
  it "returns result based on my attack type 'fire' vs opp deff 'water'" do
    pokemon = Tools::Pokemon.new('fire', 'water', 100, 100)
    expect(pokemon.calculate_damage).to eq 25
  end

  it "returns result from my attack 'grass' vs opp deff 'fire'" do
    pokemon = Tools::Pokemon.new('grass', 'fire', 35, 5)
    expect(pokemon.calculate_damage).to eq 175
  end

  it "returns result from my attack 'electric' vs opp deff 'fire'" do
    pokemon = Tools::Pokemon.new('electric', 'fire', 100, 100)
    expect(pokemon.calculate_damage).to eq 50
  end

  it "returns result form my attack 'water' vs opp deff 'electric'" do
    pokemon = Tools::Pokemon.new('water', 'electric', 50, 5)
    expect(pokemon.calculate_damage).to eq 250
  end
end