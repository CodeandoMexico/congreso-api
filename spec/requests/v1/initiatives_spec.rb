require 'spec_helper'
describe 'Initiatives API' do
  it 'sends a list of paginated initatives' do
    FactoryGirl.create_list(:initiative, 5)

    get '/v1/iniciativas'

    expect(response).to be_success

    expect(json.length).to eq(Initiative.count)
  end
end
