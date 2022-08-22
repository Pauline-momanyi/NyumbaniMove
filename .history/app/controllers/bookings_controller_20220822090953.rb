class BookingsController < ApplicationController
class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        bookin gd = Student.all
        render json: bookin gd
    end
    def show
        bookin gd = Student.find(params[:id])
        render json: bookin gd
    end
    def create
        bookin gd = Student.create!(student_params)
        render json: bookin gd, status: :accepted
    end

    def update
        bookin gd = Student.find(params[:id])
        bookin gd.update(student_params)
        render json: bookin gd
    end

    def destroy
        bookin gd = Student.find(params[:id])
        bookin gd.destroy!
        # render json: students
        head :no_content
    end


    private

    def render_not_found_response
        render json: { error: "bookin gd not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end

end
