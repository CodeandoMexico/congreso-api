require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Votes' do

  get '/v1/iniciativas/:initative_id/votos' do
    init_with_votes = FactoryGirl.create(:initiative_with_votes_and_deputies)
    let(:initative_id) { init_with_votes.id }
    example_request 'sends votes for an initiative' do
      status.should be 200

      expect(json.length).to eq(10)
    end
  end
end
