module V1
  class VotesController < ApplicationController
    def index
      @votes = Vote.where("initiative_id = ?", params[:initiative_id])
      render json: @votes
    end
  end
end
