module V1
  class DeputiesController < ApplicationController
    def index
      @deputies = Deputy.all
      render json: @deputies
    end

    def top
      @top = Deputy.top(params[:tipo_voto], params[:periodo], params[:ano], params[:legislatura], params[:order])

      render json: @top
    end
  end
end
