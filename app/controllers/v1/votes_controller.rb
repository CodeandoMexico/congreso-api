module V1
  class VotesController < ApplicationController
    def index
      @votes = Initiative.find(params[:initiative_id]).votes
      render json: @votes
    end
  end
end
