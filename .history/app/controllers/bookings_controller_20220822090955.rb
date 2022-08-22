class BookingsController < ApplicationController
class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        bookin = Student.all
        render json: bookin
    end
    def show
        bookin = Student.find(params[:id])
        render json: bookin
    end
    def create
        bookin = Student.create!(student_params)
        render json: bookin, status: :accepted
    end

    def update
        bookin = Student.find(params[:id])
        bookin.update(student_params)
        render json: bookin
    end

    def destroy
        bookin = Student.find(params[:id])
        bookin.destroy!
        # render json: students
        head :no_content
    end


    private

    def render_not_found_response
        render json: { error: "bookin not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end

end
