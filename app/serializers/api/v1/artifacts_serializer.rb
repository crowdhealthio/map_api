module Api
  module V1
    class ArtifactsSerializer < ActiveModel::Serializer

      attributes :type, :properties, :geometry

      private

      def type
        "Feature"
      end

      def properties
        {
          name: object.name,
          description: "#{object.name}<br/>#{object.long_description}"
        }
      end

      def geometry
        {
          type: "Point",
          coordinates: [
            object.lat.to_f,
            object.lng.to_f,
            0
          ]
        }
      end

    end
  end
end
