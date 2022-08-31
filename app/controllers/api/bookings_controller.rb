class Api::BookingsController < ApplicationController
    before_action :authorize
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        bookings = Booking.all
        render json: bookings
    end
    def show
        booking = Booking.find(params[:id])
        render json: booking
    end
    def create
        booking = @current_user.bookings.create!(booking_params)
        render json: booking, status: :accepted
    end

    def update
        booking = Booking.find_by(id: params[:id])
        booking.update(booking_params)
        render json: bookings
    end

    def destroy
        booking = Booking.find_by(id: params[:id])
        booking.destroy!
        head :no_content
    end


    private
    def booking_params
        params.permit(:date,:origin, :destination, :distance,:cost, :houseSize )
    end

    def render_not_found_response
        render json: { error: "bookings not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end

