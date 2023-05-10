
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Users", type: :request do
  path '/users' do
    post('create user API') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: 'object',
        properties: {
          email: { type: :string, nullable: false, default: 'user-test@example.com' },
          password: { type: :string, nullable: false, default: '123456' },
          password_confirmation: { type: :string, nullable: false, default: '123456' }
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
