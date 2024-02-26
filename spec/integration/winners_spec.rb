require 'swagger_helper'

describe 'Winners API' do

  path '/winners' do

    get 'Retrieves a list of winners', paginated: true do
      tags 'Winners'
      produces 'application/json'

      response '200', 'winners found' do
        schema type: :object,
              properties: {
                winners: {
                  type: :array,
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
                },
                current_page: { type: :integer },
                next_page: { type: :integer },
                prev_page: { type: :integer },
                total_pages: { type: :integer },
                total_entries: { type: :integer }
              }

        before do
          # Setup
          11.times do |i|
            user = FactoryBot.create(:user)
            Winner.create!(user: user, latitude: 40.416775, longitude: -3.703790)
          end
        end

        it 'returns first page of winners by default' do
          get '/winners', headers: { 'Accept' => 'application/json' }
          expect(response).to have_http_status(200)
          expect(response.headers['Content-Type']).to include('application/json')
          
          json = JSON.parse(response.body)
          expect(json['winners'].size).to eq(5)
          expect(json['current_page']).to eq(1)
          expect(json['next_page']).to eq(2)
          expect(json['prev_page']).to eq(nil)
          expect(json['total_pages']).to eq(3)
          expect(json['total_entries']).to eq(11)
        end

        it 'returns specific page of winners' do
          get '/winners', params: { page: 3, per_page: 5 }, headers: { 'Accept' => 'application/json' }
          expect(response).to have_http_status(200)
          expect(response.headers['Content-Type']).to include('application/json')
          
          json = JSON.parse(response.body)
          expect(json['winners'].size).to eq(1)
          expect(json['current_page']).to eq(3)
          expect(json['next_page']).to eq(nil)
          expect(json['prev_page']).to eq(2)
          expect(json['total_pages']).to eq(3)
          expect(json['total_entries']).to eq(11)
        end

      end
    end
  end
end
