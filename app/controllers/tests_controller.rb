class TestsController < ApplicationController
    def index 
        render json: {text: "Hello from rails api"}
    end

    def show 
        user = User.find_by(id: params[:id])
    end
end
