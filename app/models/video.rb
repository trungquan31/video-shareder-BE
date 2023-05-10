# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :users, through: :user_videos

  validates :url, presence: true, uniqueness: true, format: { with: %r{youtube.com.*(?:/|v=)([^&$]+)} }
end
