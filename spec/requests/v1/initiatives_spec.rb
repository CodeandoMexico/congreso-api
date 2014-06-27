require 'spec_helper'
describe 'Initiatives API' do
  it 'sends a list of paginated initatives' do
    FactoryGirl.create_list(:initiative, 10)
    double(Initiative.max_paginates_per(5))

    get '/v1/iniciativas'

    expect(response).to be_success

    expect(json.length).to eq(5)
  end
end
