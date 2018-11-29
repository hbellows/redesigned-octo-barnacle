module Api
  module V1
    class UserController < ApiBaseController
      def show
        render json: UserSerializer.new(current_user)
      end
    end
  end
end

