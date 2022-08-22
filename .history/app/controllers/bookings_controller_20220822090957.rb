class BookingsController < ApplicationController
class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        bookingd = Student.all
        render json: bookingd
    end
    def show
        bookingd = Student.find(params[:id])
        render json: bookingd
    end
    def create
        bookingd = Student.create!(student_params)
        render json: bookingd, status: :accepted
    end

    def update
        bookingd = Student.find(params[:id])
        bookingd.update(student_params)
        render json: bookingd
    end

    def destroy
        bookingd = Student.find(params[:id])
        bookingd.destroy!
        # render json: students
        head :no_content
    end


    private

    def render_not_found_response
        render json: { error: "bookingd not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end

end
