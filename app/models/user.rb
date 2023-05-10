# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password

  has_many :user_videos, dependent: :destroy
  has_many :videos, through: :user_videos

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end
