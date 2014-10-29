require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Iniciativas' do
  FactoryGirl.create_list(:initiative, 10)

  get '/v1/iniciativas' do
    example 'Lista paginada de iniciativas' do
      double(Initiative.max_paginates_per(5))
      do_request

      status.should be 200

      expect(json.length).to eq(5)
    end

    example 'Siguiente página de las iniciativas' do
      double(Initiative.max_paginates_per(5))

      do_request(page: 2)
      status.should be(200)

      expect(json.length).to eq(5)
    end
  end
end
