require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Deputies' do
  get '/v1/diputados' do
    example_request 'sends a list of deputies' do
      status.should be (200)
    end
  end
end
