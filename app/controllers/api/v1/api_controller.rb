module Api
  module V1
    class ApiController < ActionController::Base

      protected

      def geo_json(artifacts)

        {
          type: "FeatureCollection",
          features: artifacts.map { |artifact| ArtifactsSerializer.new(artifact) }
        }

      end

      def render_errors_for(object, options = {})
        json_params = {}
        json_params[:errors] = object.errors if object.respond_to?(:errors)
        json_params[:action] = object.error_actions if object.respond_to?(:error_actions)
        json_params[:user_message] = object.user_error_message if object.respond_to?(:user_error_message)

        # note that outer brackets are required, because of the #merge call
        render(
          {
            json: json_params,
            status: :unprocessable_entity
          }.merge(options)
        )
      end

    end
  end
end
