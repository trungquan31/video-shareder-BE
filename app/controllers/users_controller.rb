# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @user = User.new(permitted_params)
    return if @user.save

    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.permit(:email, :password, :password_confirmation)
  end
end
