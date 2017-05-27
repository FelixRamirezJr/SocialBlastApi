class ApplicationController < ActionController::API

    def test
      render json: User.first
    end

end
