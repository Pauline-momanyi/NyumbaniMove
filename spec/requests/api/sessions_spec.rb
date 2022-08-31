require 'swagger_helper'

RSpec.describe 'api/sessions', type: :request do

  path '/api/login' do

    post('create session') do
      tags 'Sessions'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :params, in: :body, schema: {
          type: :object,
          properties: {
            email: {type: :string},
            password: { type: :string }
          },
          required: %w[email password ]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'Invalid email or password') do
        let(:params) { 'invalid' }
        run_test!
      end
    end
  end
  
  path '/api/logout' do

    delete('delete session') do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      produces 'application/json'
      response(200, 'successful logout') do
        let(:id) { create(:booking).id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'user not found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end


end
