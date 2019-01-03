class Asteroid

  attr_reader :name, :neo_reference_id, :id, :is_potentially_hazardous_asteroid

  def initialize(asteroid_data)
    @name = asteroid_data[:name]
    @neo_reference_id = asteroid_data[:neo_reference_id]
    @is_potentially_hazardous_asteroid = asteroid_data[:is_potentially_hazardous_asteroid]
    @id = asteroid_data[:id]
  end
end