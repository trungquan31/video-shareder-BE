# frozen_string_literal: true

class ApplicationController < ActionController::API
  wrap_parameters false
  before_action :authenticate_user

  def current_user
    @current_user ||= User.find_by(email: authenticate_user[:user_email])
    @current_user
  end

  private

  def authenticate_user
    auth_user = JsonWebToken.decode(auth_param)
    if auth_user.blank? || auth_user[:user_email].blank?
      return render json: { errors: 'USER NOT EXITS' },
                    status: :unprocessable_entity
    end

    auth_user
  end

  def auth_param
    return params[:access_token] if params[:access_token].present?

    render json: { errors: 'Missing token' }, status: :unprocessable_entity
  end
end
