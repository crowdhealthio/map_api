module Api
  module V1
    class TypesController < ActionController::Base
      def index
        render json: Artifact.types, each_serializer: TypesSerializer
      end

      def show
        render json: geo_json(Artifact.where(artifact_type: params[:id]))
      end

      def nearest
        lat = params["lat"]
        lng = params["lng"]
        space = [lat.to_f, lng.to_f]

        render json: geo_json(
          Artifact.within(5, origin: space)
                  .where(artifact_type: params[:type_id])
        )
      end

      private

      def geo_json(artifacts)

        {
          type: "FeatureCollection",
          features: artifacts.map { |artifact| ArtifactsSerializer.new(artifact) }
        }

      end

    end
  end
end
