module Api
  module V1
    class ArtifactsController < ApiController

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

      def update
        artifact = Artifact.find_by(id: params[:id])
        if artifact.update(artifact_params)
          render json: artifact
        else
          render_errors_for artifact
        end
      end

      private

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
