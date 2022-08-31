class Api::MoversController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        movers = Mover.all
        render json: movers
    end
    def show
        movers = Mover.find(params[:id])
        render json: movers
    end

    def create
        movers = Mover.create!(movers_params)
        render json: movers, status: :accepted
    end

    def update
        mover = Mover.find_by(id: params[:id])
        mover.update(is_mover: true)
        render json: mover
    end

    def destroy
        movers = Mover.find(params[:id])
        movers.destroy!
        head :no_content
    end


    private
    def movers_params
        params.permit(:name,:email,:phone, :password, :password_confirmation, :is_admin,:is_mover, :is_client  )
    end

    def render_not_found_response
        render json: { error: "mover not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
