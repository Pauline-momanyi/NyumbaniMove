class BookingsController < ApplicationController
class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        students = Student.all
        render json: students
    end
    def show
        students = Student.find(params[:id])
        render json: students
    end
    def create
        students = Student.create!(student_params)
        render json: students, status: :accepted
    end

    def update
        students = Student.find(params[:id])
        students.update(student_params)
        render json: students
    end

    def destroy
        students = Student.find(params[:id])
        students.destroy!
        # render json: students
        head :no_content
    end


    private

    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end

end
