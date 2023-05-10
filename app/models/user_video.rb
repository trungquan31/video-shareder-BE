# frozen_string_literal: true

class UserVideo < ApplicationRecord
  belongs_to :user
  belongs_to :video

  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :user_id, uniqueness: { scope: :video_id }
  # rubocop:enable Rails/UniqueValidationWithoutIndex
end
