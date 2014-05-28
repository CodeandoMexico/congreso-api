require "spec_helper"
describe "Votes API" do
  it "sends a paginated list of votes for an iniciative" do
    FactoryGirl.create(:initiative_with_votes)

    get '/v1/iniciativas/1/votos'

    expect(response).to be_success

    expect(json.length).to eq(5)
  end
end
