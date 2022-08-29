class Api::UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def create 
        
        if params[:is_mover]
            user = Mover.create!(user_params)
        else
            user = User.create!(user_params)
        end 

        # byebug
        # render json: user, status: :created
        # byebug
        
        if user.valid? 
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end 

    def show 
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :created
        else
            render json: "Not authorised", status: :unauthorized
        end
        # render json: @current_user
        
    end
    def index
        movers = Mover.all
        render json: movers
    end
    private 
    def user_params
        params.permit(:name, :email, :phone, :password, :password_confirmation, :is_mover, :is_client)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
