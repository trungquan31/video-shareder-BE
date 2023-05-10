# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  path '/sessions/signin' do
    post('sign in API') do
      tags 'Session/signin'
      consumes 'application/json'
      parameter name: :session, in: :body, schema: {
        type: 'object',
        properties: {
          email: { type: :string, nullable: false, default: 'test-user@example.com' },
          password: { type: :string, nullable: false, default: '123456' }
        }
      }
      response(200, 'Created') do
        schema '$ref' => '#/components/schema/sessions'
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema '$ref' => '#/components/schema/errors'
        run_test!
      end
    end
  end
end

