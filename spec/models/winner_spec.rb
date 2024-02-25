require 'rails_helper'

RSpec.describe Winner, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_numericality_of(:latitude) }
    it { should validate_numericality_of(:longitude) }
  end

  let(:user) { User.create!(email: 'test@example.com') }
  let(:winner) { Winner.create!(user: user, latitude: 40.416775, longitude: -3.703790) }

  describe '#as_json' do
    it 'returns the expected JSON structure' do
      expected_json = {
        id: winner.id,
        email: winner.user.email,
        distance_to_treasure: winner.distance_to_treasure,
        latitude: winner.latitude,
        longitude: winner.longitude
      }

      expect(winner.as_json.symbolize_keys).to eq(expected_json)
    end
  end

  describe '#calculate_distance' do
    context 'when the distance to the treasure is within the radius' do
      it 'sets the distance_to_treasure attribute' do
        expect(winner.distance_to_treasure).to be_within(0.1).of(0)
      end

      it 'sends an email to the winner' do
        winner = Winner.new(user: user, latitude: 40.416775, longitude: -3.703790)
        expect(WinnerMailer).to receive(:with).with(winner: winner).and_return(double(congratulate: double(deliver_now: true)))
        winner.save!
      end
    end

    context 'when the distance to the treasure is outside the radius' do
      it 'adds an error and aborts the save' do
        winner = Winner.new(user: user, latitude: -40.416775, longitude: 3.703790)
        winner.save
        expect(winner.errors[:distance_to_treasure]).to include("is too far away from the treasure")
      end
    end
  end


end
