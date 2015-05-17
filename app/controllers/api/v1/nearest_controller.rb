module Api
  module V1
    class NearestController < ApiController

      def index
        render json: Types.all, each_serializer: TypesSerializer
      end

      def show
        lat = params["lat"]
        lng = params["lng"]
        space = [lng.to_f, lat.to_f]

        render json: geo_json(Artifact.closest(origin: space))
      end

    end
  end
end
