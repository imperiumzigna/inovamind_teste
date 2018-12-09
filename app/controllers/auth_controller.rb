class AuthController < ApplicationController
    skip_before_action :authenticate_request
   
    # /api/login
    def login
        @command = AuthenticateUser.call(login_params)
        if @command.success?
           render :login
        else
           render :login, status: :unauthorized
        end
    end

    # /api/register
    def register
        @user = User.new(register_params)
        if @user.save
            render :user
        else
            render :user_errors
        end
    end

    private

    def register_params
        params.permit(:email,:name,:password, :password_confirmation)
    end

    
    def login_params
        params.permit(:email, :password )
    end
end
