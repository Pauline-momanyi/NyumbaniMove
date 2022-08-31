require 'swagger_helper'

RSpec.describe 'api/users', type: :request do

  path '/api/signup' do

    post('create user') do
      tags 'Users'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :params, in: :body, schema: {
          type: :object,
          properties: {
            name: {type: :string},
            email: {type: :string},
            phone: { type: :string },
            password: { type: :string },
            password_confirmation: {type: :string},
          },
          required: %w[name email phone password confirm_password ]
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
      response(422, 'Invalid details') do
        let(:params) { 'invalid' }
        run_test!
      end
    end
  end


   
    

  path '/api/me' do

    get('show user') do
      tags 'Users'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(401, 'unauthorized') do
        run_test!
      end
    end   
  end

  path '/api/users' do

    get('list users') do
      tags 'Users'
      response(200, 'users found') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

  end

  # path '/api/me/{id}' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('show user') do
  #     tags 'Users'
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #     response(404, 'user not found') do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end
  #   end
  # end
end
