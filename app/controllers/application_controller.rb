# frozen_string_literal: true

class ApplicationController < ActionController::API
  wrap_parameters false
  before_action :authenticate_user

  def current_user
    render json: { errors: 'token expire' } if authenticate_user[:user_email].blank?

    @current_user ||= User.find_by(email: authenticate_user[:user_email])
    @current_user
  end

  private

  def authenticate_user
    JsonWebToken.decode(auth_header)
  end

  def auth_header
    return params[:access_token].split.last if params[:access_token].present?

    render json: { errors: 'Missing token' }
  end
end
