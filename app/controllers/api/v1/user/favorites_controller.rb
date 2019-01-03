class Api::V1::User::FavoritesController < ApiBaseController

  def index
    favorites = current_user.favorites
    render json: FavoritesSerializer.new(favorites)
  end
  
  def create
    favorite = current_user.favorites.find_or_create_by(neo_reference_id: params[:neo_reference_id])
    render json: FavoritesSerializer.new(favorite)
  end
end

# def create
#   favorite = current_user.favorites.find_or_create_by(neo_reference_id: params[:neo_reference_id])

#   render json: favorite, serializer: FavoriteSerializer
# end