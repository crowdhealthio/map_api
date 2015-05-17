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

      def destroy
        artifact = Artifact.find_by(id: params[:id])
        if artifact.destroy
          head :ok
        else
          render_errors_for artifact
        end
      end

      def show
        render json: Artifact.find_by(id: params[:id])
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
            :artifact_type,
            :properties
          ]
        )
      end
    end
  end
end
