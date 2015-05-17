module Api
  module V1
    class TypesController < ApiController
      def index
        render json: Artifact.types, each_serializer: TypesSerializer
      end

      def show
        render json: geo_json(Artifact.where(artifact_type: params[:id]))
      end

      def nearest
        lat = params["lat"]
        lng = params["lng"]
        distance = params["distance"] || 5
        space = [lng.to_f, lat.to_f]

        render json: geo_json(
          Artifact.within(distance, origin: space)
                  .where(artifact_type: params[:type_id])
        )
      end
    end
  end
end
