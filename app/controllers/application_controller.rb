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
    render json: { errors: 'USER NOT EXITS' } if auth_user[:user_email].blank?
    auth_user
  end

  def auth_param
    return params[:access_token].split.last if params[:access_token].present?

    render json: { errors: 'Missing token' }
  end
end
