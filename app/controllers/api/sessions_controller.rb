class Api::SessionsController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unauthorized
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create 
        user = Admin.find_by(email: params[:email]) || User.find_by(email: params[:email]) || Mover.find_by(email: params[:email])
        # byebug
        if  user&.authenticate(params[:password]) 
            session[:user_id] = user.id 
            render json: user 
        else  
            render json: { errors: ["Invalid email or password"] }, status: :unauthorized
        end
    end 

    def destroy 
        # session.delete :user_id
        # session[:user_id] = nil
        # head :no_content 
                
        if User.find_by(id: session[:user_id])
            session.delete :user_id
            head :no_content 
        else
            render json: { errors: ["Invalid email or password"] }, status: :unauthorized
        end
    end

    private 
    # def user_params
    #     params.permit(:email, :password)
    # end
    # def render_unauthorized
    #     render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    # end

    # def render_unprocessable_entity_response(exception)
    #     render json: { errors: exception.record.errors.full_messages }, status: :unauthorized
    #   end
end

