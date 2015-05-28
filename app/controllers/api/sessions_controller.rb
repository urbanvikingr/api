module Api
  class SessionsController < ApplicationController
    # skip_before_action :authenticate_user_from_token!
    # skip_after_action :verify_authorized, only: :index

    def create
      user = User.from_omniauth(auth_params)
      session[:user_id] = user.id
      render json: {}, status: :ok
    end

    def destroy
      session[:user_id] = nil
      render json: {}, status: :ok
    end

    def failure
      render json: {}, status: :unauthorized
    end

    private

    def auth_params
      env.fetch("omniauth.auth")
    end
  end
end
