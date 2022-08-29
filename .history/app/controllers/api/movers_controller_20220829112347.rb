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
        movers = Booking.create!(booking_params)
        render json: movers, status: :accepted
    end

    def update
        movers = Booking.find(params[:id])
        movers.update(booking_params)
        render json: movers
    end

    def destroy
        bookings = Booking.find(params[:id])
        bookings.destroy!
        head :no_content
    end


    private
    def booking_params
        params.permit(:date,:origin, :destination, :distance,:cost,  )
    end

    def render_not_found_response
        render json: { error: "bookings not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
