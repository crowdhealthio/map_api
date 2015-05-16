module Api
  module V1
    class ArtifactsController < ActionController::Base

      def index
        render json: Object.new
      end

      def create
        location = Location.build(location_params)

        if location.save
          render json: location, serializer: locationesSerializer, status: :created
        else
          render json: location.errors, status: :unprocessable_entity
        end
      end

      private

      def location_params
        params.permit(
          location: [
            :name,
            :long_description,
            :lat,
            :lng
          ]
        )
      end
    end
  end
end
