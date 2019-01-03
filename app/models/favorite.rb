class Favorite < ApplicationRecord
  belongs_to :user

  def asteroid
    {
      name: favorites[:name],
      is_potentially_hazardous_asteroid: favorites[:is_potentially_hazardous_asteroid]
    }
  end

  private

  def favorites
    @favorites ||= nasa_service.find_favorites(neo_reference_id)
  end

  def nasa_service
    NasaService.new
  end
end
