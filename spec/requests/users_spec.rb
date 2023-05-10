
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Users", type: :request do
  path '/users' do
    post('create user API') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: 'object',
        properties: {
          email: { type: :string, nullable: false, default: 'test-user@example.com' },
          password_digest: { type: :string, nullable: false, default: '123456' }
        }
      }
      response(200, 'Created') do
        schema '$ref' => '#/components/schema/users'
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema '$ref' => '#/components/schema/errors'
        run_test!
      end
    end
  end
end
