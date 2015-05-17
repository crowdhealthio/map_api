module Api
  module V1
    class ArtifactsController < ApiController

      def index
        render json: geo_json(Artifact.all)
      end

      def create
        artifact = Artifact.new(artifact_params["artifact"])
        # artifact.type = Type.find_or_create_by(
        #   name: pluralize(1, artifact_params["artifact"]["artifact_type"])
        # )

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
        render json: geo_json(Artifact.where(id: params[:id]).limit(1))
      end

      private

      def as_machine_id(string)
        string = string.downcase
      end

      def artifact_params
        params.permit!
      end
    end
  end
end
