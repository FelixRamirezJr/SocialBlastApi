class ApplicationController < ActionController::API

    def test
      render json: "Some data"
    end

end
