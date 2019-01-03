class NasaService

  def find_asteroids(start_date, end_date)
    get_json("feed?start_date=#{start_date}&end_date#{end_date}&api_key=ZPycd6QdDomEjdvsRincKywAAutzKGpP3mhnj5EB")
  end

  def find_favorites(neo_reference_id)
    get_json("neo/#{neo_reference_id}?api_key=ZPycd6QdDomEjdvsRincKywAAutzKGpP3mhnj5EB")
  end
  
  private
  
  def conn
    Faraday.new(url: "https://api.nasa.gov/neo/rest/v1/") do |faraday|
      # faraday.params['api_key'] = ENV['nasa_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end




