require 'spec_helper'
describe 'Votes API' do

  let!(:init_with_votes) { FactoryGirl.create(:initiative_with_votes) }

  it 'sends a list of votes for an initiative' do
    get "/v1/iniciativas/#{init_with_votes.id}/votos"

    expect(response).to be_success

    expect(json.length).to eq(5)
  end
end
