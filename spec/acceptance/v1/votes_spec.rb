require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Votos' do

  get '/v1/iniciativas/:initative_id/votos' do
    init_with_votes = FactoryGirl.create(:initiative_with_votes_and_deputies)
    let(:initative_id) { init_with_votes.id }
    example_request 'Lista de votos para una iniciativa' do
      expect(status).to eq(200)

      expect(json.length).to eq(10)
    end
  end
end
