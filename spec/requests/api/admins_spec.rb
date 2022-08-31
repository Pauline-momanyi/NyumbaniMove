require 'swagger_helper'

RSpec.describe 'api/admins', type: :request do

  path '/api/admins' do

    get('list admins') do
      tags 'Admins'
      response(200, 'admins found') do

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

  path '/api/admins/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show admin') do
      tags 'Admins'
      produces 'application/json'
      response(200, 'admin found') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
  
      response(404, 'admin not found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
