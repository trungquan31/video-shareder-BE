# frozen_string_literal: true

json.array! @videos.map(&:url)
