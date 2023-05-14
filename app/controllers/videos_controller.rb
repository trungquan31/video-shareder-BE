# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @videos = current_user.videos
  end

  def create
    response = ::Videos::Sharer.new(permitted_params, current_user).call
    payload = response[:payload]
    if response[:success]
      send_message(generate_messages(permitted_params[:url]))
      return render json: { messages: 'Video shared successful', payload: payload },
                    status: :created
    end

    render json: { errors: payload }, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.permit(:url)
  end

  def send_message(message)
    return unless message.present?

    # gateway.get('/send_notification', { message: message }, {  "Content-Type" => "application/json" })
  end

  def gateway
    Faraday.new(
      url: ENV.fetch('http://localhost:5000/', nil),
      headers: { "Content-Type" => "application/json" }
    )
  end

  def youtube_id(youtube_url)
    regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    match = regex.match(youtube_url)
    if match && !match[1].blank?
      match[1]
    else
      nil
    end
  end

  def generate_messages(url)
    return unless url.present?
    video = VideoInfo.new(url)
    title = video.title
    {user: current_user.email , title:  title}
  end
end
