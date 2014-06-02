module V1
  class VotesController < ApplicationController
    def index
      @votes = Initiative.find(params[:initiative_id]).votes
      paginate json: @votes
    end
  end
end
