require 'swagger_helper'

describe 'Winners API' do

  path '/winners' do

    get 'Retrieves a list of winners' do
      tags 'Winners'
      produces 'application/json'

      response '200', 'winners found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              latitude: { type: :float },
              longitude: { type: :float },
              distance_to_treasure: { type: :float },
              email: { type: :string },
            }
          }

        before do
          # Setup
          user = User.create!(email: 'test@example.com')
          Winner.create!(user: user, latitude: 40.416775, longitude: -3.703790)
        end

        run_test!
      end
    end
  end
end
