# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end
