module Api
  module V1
    class ArtifactsController < ActionController::Base

      def index
        render json: geo_json(Artifact.all)
      end

      def create
        artifact = Artifact.new(artifact_params["artifact"])

        if artifact.save
          render json: artifact
        else
          render json: artifact.errors, status: :unprocessable_entity
        end
      end

      private

      def geo_json(artifacts)

        {
          type: "FeatureCollection",
          features: artifacts.map { |artifact| ArtifactsSerializer.new(artifact) }
        }

      end

      def artifact_params
        params.permit(
          artifact: [
            :name,
            :long_description,
            :lng,
            :lat,
            :source,
            :source_id,
            :address,
            :artifact_type
          ]
        )
      end
    end
  end
end
