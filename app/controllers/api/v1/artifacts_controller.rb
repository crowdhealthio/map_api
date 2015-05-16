module Api
  module V1
    class ArtifactsController < ActionController::Base

      def index
        render json: Artifact.all
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

      def artifact_params
        params.permit(
          artifact: [
            :name,
            :long_description,
            :lnglat,
            :supplier,
            :supplier_id,
            :address
          ]
        )
      end
    end
  end
end
