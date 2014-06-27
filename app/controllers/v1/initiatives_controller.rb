module V1
  class InitiativesController < ApplicationController
    def index
      @initiatives = Initiative.all
      paginate json: @initiatives, per_page: 500
    end

    def show
      render json: Initiative.find(params[:id])
    end
  end
end
