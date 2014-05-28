module V1
  class InitiativesController < ApplicationController

    def index
      @initiatives = Initiative.all
      render json: @initiatives
    end

  end
end
