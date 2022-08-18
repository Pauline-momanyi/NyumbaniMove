class TestsController < ApplicationController
    def index 
        render json: {text: "Hello from rails api"}
    end
end
