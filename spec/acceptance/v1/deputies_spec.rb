require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Diputados' do
  get '/v1/diputados' do
    example_request 'Lista de diputados' do
      status.should be (200)
    end
  end
end
