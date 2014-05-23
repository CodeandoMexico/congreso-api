require "spec_helper"
describe "Initiatives API" do
  it "sends a list of initatives" do
    FactoryGirl.create_list(:initiatives, 5)

    get '/api/v1/iniciativas'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['iniciativas'].length).to eq(5)
  end
end
