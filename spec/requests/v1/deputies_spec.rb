require "spec_helper"
describe "Deputies API" do
  it "sends a list of paginated deputies" do
    get '/v1/diputados'

    expect(response).to be_success

    expect(json.length).to eq(5)
  end
end
