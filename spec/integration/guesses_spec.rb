require 'swagger_helper'

describe 'Guesses API' do

  path '/guesses' do

    post 'Submits a guess for the treasure location' do
      tags 'Guesses'
      consumes 'application/json'
      produces 'application/json'
      description 'Allows users to submit a guess for the treasure\'s location. If the guess is within 1000 meters of the treasure, the user is marked as a winner, and an email is sent to them confirming their victory.'
      parameter name: :guess, in: :body, required: true, schema: {
          type: :object,
          properties: {
            email: { type: :string, description: 'User email', example: 'user@example.com' },
            latitude: { type: :number, format: :float, description: 'Latitude of the guess', example: 34.0522 },
            longitude: { type: :number, format: :float, description: 'Longitude of the guess', example: -118.2437 }
          },
          required: ['email', 'latitude', 'longitude'],
          example: {
            email: 'user@example.com',
            latitude: 34.0522,
            longitude: -118.2437
          }
        }

      response '200', 'winner guess' do
        let(:guess) { { email: 'user@example.com', latitude: 40.416775, longitude: -3.703790 } }
        schema type: :object,
               properties: {
                 message: { type: :string, example: "Congratulations, you've found the treasure!" },
               },
               examples: {
                 'application/json' => {
                   message: "Congratulations, you've found the treasure!",
                 }
               }
        run_test!
      end

      response '422', 'wrong guess' do
        let(:guess) { { email: 'user@example.com', latitude: -40.416775, longitude: 3.703790 } }
        schema type: :object,
               properties: {
                 message: { type: :string, example: "Keep trying!" },
               },
               examples: {
                 'application/json' => {
                   message: "Keep trying!",
                 }
               }
        run_test!
      end

      
    end
  end
end
