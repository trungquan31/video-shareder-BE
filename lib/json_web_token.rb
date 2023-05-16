# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, 'secret_key')
    end

    def decode(token)
      body = JWT.decode(token, 'secret_key')[0]
      ActiveSupport::HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end
  end
end
