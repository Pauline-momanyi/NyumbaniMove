require 'swagger_helper'

RSpec.describe 'api/bookings', type: :request do

  path '/api/bookings' do

    get('list bookings') do
      tags 'Bookings'
      produces 'application/json'

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
    end

    post('create booking') do
      tags 'Bookings'
      response(200, 'bookings found') do
        consumes 'application/json'
        parameter name: :booking, in: :body, schema: {
          type: :object,
          properties: {
            date: {type: :date},
            origin: {type: :string},
            destination: { type: :string },
            distance: { type: :string },
            cost: {type: :string},
            houseSize: {type: :string},
            mover_id: {type: :integer}
          },
          required: %w[date origin destination distance cost houseSize mover_id ]
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
    end
  end

  path '/api/bookings/{id}' do
    # You'll want to customize the parameter types...
 

    get('show booking') do
      tags 'Bookings'
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
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

      response(404, 'booking not found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    # patch('update booking') do
    #   tags 'Bookings'
    #   produces 'application/json'
    #   parameter name: 'id', in: :path, type: :string, description: 'id'
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    #   response(404, 'booking not found') do
    #     let(:id) { 'invalid' }
    #     run_test!
    #   end
    # end

    # put('update booking') do
    #   tags 'Bookings'
    #   produces 'application/json'
    #   parameter name: 'id', in: :path, type: :string, description: 'id'
    #   response(200, 'successful') do
    #     let(:id) { '123' }
    #     parameter name: :booking, in: :body, schema: {
    #       type: :object,
    #       properties: {
    #         date: {type: :date},
    #         origin: {type: :string},
    #         destination: { type: :string },
    #         distance: { type: :string },
    #         cost: {type: :string},
    #         houseSize: {type: :string},
    #         mover_id: {type: :integer}
    #       },
    #       required: %w[date origin destination distance cost houseSize mover_id ]
    #     }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    #   response(404, 'booking not found') do
    #     let(:id) { 'invalid' }
    #     run_test!
    #   end
    # end

    delete('delete booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      produces 'application/json'
      response(200, 'successfully deleted') do
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
      response(404, 'booking not found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
