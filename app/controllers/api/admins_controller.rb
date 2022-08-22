class Api::AdminsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def show 
        # admin = Admin.find_by(id: session[:user_id])
        admin = Admin.find_by(id: params[:id])
        if admin
            render json: admin, status: :created
        else
            render json: "Not authorised", status: :unauthorized
        end
        # render json: @current_user        
    end


    private 
    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
