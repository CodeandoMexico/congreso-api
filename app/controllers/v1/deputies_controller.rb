module V1
  class DeputiesController < ApplicationController
    include ActionController::Caching
    caches_action :top, cache_path: proc { |c| c.params }

    def index
      @deputies = Deputy.all
      render json: @deputies
    end

    def top
      initiative = Initiative.where(nil)

      filter_initiative_params.each do |key, value|
        initiative = initiative.public_send(key, value) if value.present?
      end

      order = params[:order] ? params[:order] : nil
      limit = params[:limit] ? params[:limit] : nil

      @top = Deputy.top(params[:tipo_voto], initiative, order, limit)

      render json: @top, each_serializer: DeputyTopSerializer
    end

    private

    # This is used to allow the cross origin requests
    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = %w(GET POST OPTIONS).join(',')
    end

    def filter_initiative_params
      params.slice(:periodo, :ano, :legislatura)
    end
  end
end
