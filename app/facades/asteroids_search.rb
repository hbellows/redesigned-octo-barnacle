class AsteroidsSearch
  attr_reader :start_date, :end_date
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def most_dangerous_day
    hazards.first.to_s
  end

  def asteroid_count
    asteroids.count
  end

  def asteroids
    find_asteroids.map do |data|
      Asteroid.new(data)
    end
  end

  def find_asteroids
    hazards[1..-1].each do |asteroid|
      asteroid.map do |asteroid_data|
        asteroid_data
      end
    end.flatten
  end

  def hazards
    find_hazards.max_by { |date, hazards| hazards.count }
  end

  def find_hazards
    asteroid_data[:near_earth_objects].each do |date, data|
      data.keep_if do |asteroid|
        asteroid[:is_potentially_hazardous_asteroid]
      end
    end
  end
  
  private
  
  def nasa_service
    @nasa_service ||= NasaService.new
  end

  def url_date_formatter(date)
    t = Time.parse(date)
    t.strftime('%Y-%m-%d')
  end

  def asteroid_data
    start_date = url_date_formatter(@start_date)
    end_date = url_date_formatter(@end_date)
    nasa_service.find_asteroids(start_date, end_date)
  end
end