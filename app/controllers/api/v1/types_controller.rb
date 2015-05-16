module Api
  module V1
    class TypesController < ActionController::Base
      def index
        render json: Artifact.types, each_serializer: TypesSerializer
      end

      def show
        render json: geo_json(Artifact.where(artifact_type: params[:id]))
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
