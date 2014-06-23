module V1
  class InitiativesController < ApplicationController
    def index
      @initiatives = Initiative.all
      render json: @initiatives
    end

    def show
      render json: Initiative.find(params[:id])
    end
  end
end
