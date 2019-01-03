class MostDangerousDayController < ApplicationController
  def index
    @asteroids_search = AsteroidsSearch.new(params[:start_date], params[:end_date])
  end
end
