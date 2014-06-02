module V1
  class DeputiesController < ApplicationController
    def index
      @deputies = Deputy.all
      render json: @deputies
    end
  end
end
