
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Videos", type: :request do
  path '/videos' do
    get('get list videos API') do
      tags 'Videos'
      consumes 'application/json'
      parameter name: :access_token, 
                in: :query,
                required: true,
                type: :string
      response(200, 'success') do
        run_test!
      end
      response(422, 'Unprocessable Entity') do
        schema '$ref' => '#/components/schema/errors'
        run_test!
      end
    end

    post('share videos API') do
      tags 'Videos'
      consumes 'application/json'
      parameter name: :access_token, 
                in: :query,
                required: true,
                type: :string
      parameter name: :video, in: :body, schema: {
        type: 'object',
        properties: {
          url: { type: :string, nullable: false, default: 'https://www.youtube.com/watch?v=7UfM7Lkw4U4' },
        }
      }
      response(201, 'created') do
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema '$ref' => '#/components/schema/errors'
        run_test!
      end
    end
  end
end
