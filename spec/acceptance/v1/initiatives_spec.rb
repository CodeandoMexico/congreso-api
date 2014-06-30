require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Initiatives' do
  FactoryGirl.create_list(:initiative, 10)

  get '/v1/iniciativas' do
    example 'sends a list of paginated initatives' do
      double(Initiative.max_paginates_per(5))
      do_request

      status.should be 200

      expect(json.length).to eq(5)
    end

    example 'can go to next page of initiatives' do
      double(Initiative.max_paginates_per(5))

      do_request(page: 2)
      status.should be(200)

      expect(json.length).to eq(5)
    end
  end
end
