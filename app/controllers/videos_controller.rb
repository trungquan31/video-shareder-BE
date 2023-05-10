# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @videos = current_user.videos
  end

  def create
    @user = ::Videos::Sharer.new(permitted_params, current_user).call
    if @user.errors.blank?
      return render json: { messages: 'Video shared successful', payload: permitted_params[:url] },
                    status: :created
    end

    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.permit(:url)
  end
end
