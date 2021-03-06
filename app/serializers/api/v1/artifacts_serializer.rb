module Api
  module V1
    class ArtifactsSerializer < ActiveModel::Serializer

      attributes :type, :properties, :geometry

      private

      def type
        "Feature"
      end

      def properties
        object.properties ||= {}
        {
          id: object.id,
          name: object.name,
          description: "#{object.name}<br/>#{object.long_description}"
        }.merge(object.properties)
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
