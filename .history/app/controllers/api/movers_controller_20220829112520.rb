class Api::MoversController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        movers = Booking.all
        render json: movers
    end
    def show
        movers = Booking.find(params[:id])
        render json: movers
    end
    def create
        movers = Booking.create!(movers_params)
        render json: movers, status: :accepted
    end

    def update
        movers = Booking.find(params[:id])
        movers.update(movers_params)
        render json: movers
    end

    def destroy
        movers = Booking.find(params[:id])
        movers.destroy!
        head :no_content
    end


    private
    def movers_params
        params.permit(:name,:email,:phone, :password_digest, :is_  )
    end

    def render_not_found_response
        render json: { error: "mover not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
