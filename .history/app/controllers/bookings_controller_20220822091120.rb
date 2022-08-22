class BookingsController < ApplicationController
class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        bookings = Booking.all
        render json: bookings
    end
    def show
        bookings = Booking.find(params[:id])
        render json: bookings
    end
    def create
        bookings = Booking.create!(booking)
        render json: bookings, status: :accepted
    end

    def update
        bookings = Booking.find(params[:id])
        bookings.update(booking)
        render json: bookings
    end

    def destroy
        bookings = Booking.find(params[:id])
        bookings.destroy!
        # render json: students
        head :no_content
    end


    private

    def render_not_found_response
        render json: { error: "bookings not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end

end
